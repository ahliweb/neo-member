import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;
import 'package:universal_html/html.dart' as ht;
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class DatabaseBuktiForm extends StatefulComponent {
  final bool isAdd;
  final mem.Member member;
  final mem.DatabaseMember? bukti;
  final VoidCallback onClose;
  final void Function(String, bool) showNotification;

  const DatabaseBuktiForm({
    required this.isAdd,
    required this.member,
    this.bukti,
    required this.onClose,
    required this.showNotification,
    super.key,
  });

  @override
  State<StatefulComponent> createState() => _DatabaseBuktiFormState();
}

class _DatabaseBuktiFormState extends State<DatabaseBuktiForm> {
  final client = mem.Client('http://localhost:8080/');

  bool isLoading = false;
  String? fotoUrl;
  String keterangan = '';

  @override
  void initState() {
    super.initState();
    if (!component.isAdd && component.bukti != null) {
      fotoUrl = component.bukti!.buktiPembayaran;
      keterangan = component.bukti!.keterangan;
    }
  }

  Future<void> submitForm() async {
    setState(() => isLoading = true);
    try {
      if (component.isAdd) {
        // Add DatabaseMember
        final newBukti = mem.DatabaseMember(
          buktiPembayaran: fotoUrl ?? 'Tidak ada foto',
          keterangan: keterangan,
          pelangganId: component.member.id!,
        );
        await client.databaseMember.addDatabaseMember(newBukti);
        component.showNotification('Bukti pembayaran berhasil ditambahkan!', true);
      } else {
        // Update DatabaseMember
        final updatedBukti = component.bukti!.copyWith(
          buktiPembayaran: fotoUrl,
          keterangan: keterangan,
        );
        await client.databaseMember.updateDatabaseMember(updatedBukti);
        component.showNotification('Bukti pembayaran berhasil diperbarui!', true);
      }
      component.onClose();
    } catch (e) {
      print('Error submitForm: $e');
      component.showNotification('Gagal menyimpan bukti pembayaran: $e', false);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void promptUploadBukti() async {
    final input = ht.FileUploadInputElement()
      ..accept = 'image/*'
      ..click();

    input.onChange.listen((event) async {
      if (input.files != null && input.files!.isNotEmpty) {
        final file = input.files!.first;

        if (file.size > 5 * 1024 * 1024) {
          print('File terlalu besar! Maks 5MB');
          return;
        }

        final reader = ht.FileReader();
        reader.readAsDataUrl(file);
        await reader.onLoad.first;

        setState(() {
          fotoUrl = reader.result as String;
        });

        // Upload ke Object Storage
        final fileName =
            'bukti-${DateTime.now().millisecondsSinceEpoch}.${file.name.split('.').last}';
        final uploadedUrl = await uploadFileToObjectStorage(file, fileName);

        if (uploadedUrl != null) {
          setState(() {
            fotoUrl = uploadedUrl;
          });
        } else {
          print('Gagal mengunggah bukti pembayaran');
        }
      }
    });
  }

  Future<String?> uploadFileToObjectStorage(ht.File file, String fileName) async {
    const endpoint = 'https://s3.nevaobjects.id';
    const bucketName = 'app-membership-01';

    try {
      final reader = ht.FileReader();
      reader.readAsArrayBuffer(file);
      await reader.onLoadEnd.first;

      final fileBytes = reader.result as Uint8List;

      // Header untuk upload
      final headers = {
        'Content-Type': file.type,
        'x-amz-acl': 'public-read',
      };

      // URL tujuan upload
      final uploadUrl = Uri.parse('$endpoint/$bucketName/$fileName');

      final response = await http.put(
        uploadUrl,
        body: fileBytes,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return '$endpoint/$bucketName/$fileName'; // URL file yang diunggah
      } else {
        print('Error uploading file: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (isLoading) {
      yield div([text('Menyimpan data...')]);
      return;
    }

    yield div(classes: 'database-bukti-form', [
      h3([text(component.isAdd ? 'Tambah Bukti' : 'Edit Bukti')]),
      // Foto URL / Preview?
      div(classes: 'form-group-bukti', [
        label([text('Upload Bukti Pembayaran')]),
        if (fotoUrl != null)
          img(
            src: fotoUrl!,
            alt: 'Bukti Pembayaran',
            classes: 'bukti-image-preview',
          )
        else
          div(classes: 'no-bukti-message',[text('Belum ada foto')]),
        button(
          classes: 'upload-button',
          onClick: promptUploadBukti,
          [text(fotoUrl != null ? 'Ubah Foto' : 'Tambah Foto')],
        ),
      ]),

      // Keterangan
      div(classes: 'form-group', [
        label([text('Keterangan')]),
        textarea(
          [text(keterangan)],
          onInput: (val) => setState(() => keterangan = val),
        ),
      ]),

      // Tombol
      div(classes: 'form-actions', [
        button(
          classes: 'save-button',
          onClick: submitForm,
          [text('Simpan')],
        ),
        button(
          classes: 'cancel-button',
          onClick: component.onClose,
          [text('Batal')],
        ),
      ]),
    ]);
  }
}
