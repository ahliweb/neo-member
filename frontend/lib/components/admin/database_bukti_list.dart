import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;
import 'database_bukti_form.dart';
import 'database_bukti_delete_popup.dart';

class DatabaseBuktiList extends StatefulComponent {
  final mem.Member member;
  final VoidCallback onClose;
  final void Function(String, bool) showNotification;

  const DatabaseBuktiList({
    required this.member,
    required this.onClose,
    required this.showNotification, 
    super.key,
  });

  @override
  State<StatefulComponent> createState() => _DatabaseBuktiListState();
}

class _DatabaseBuktiListState extends State<DatabaseBuktiList> {
  final client = mem.Client('http://localhost:8080/');

  bool isLoading = false;
  List<mem.DatabaseMember> buktiList = [];
  bool isFormVisible = false;
  bool isDeletePopupVisible = false;

  bool isAddMode = false; // bedakan add/edit
  mem.DatabaseMember? selectedBukti;

  @override
  void initState() {
    super.initState();
    fetchBuktiMember();
  }

  Future<void> fetchBuktiMember() async {
    setState(() => isLoading = true);
    try {
      // Contoh: Mencari DatabaseMember dengan pelangganId = member.id
      // Pastikan kolom "id" di Member adalah ID unique
      // Ganti getDatabaseMemberByPelangganId sesuai definisi endpoint
      final data = await client.databaseMember.getDatabaseMemberByPelangganId(component.member.id!);
      setState(() => buktiList = data);
    } catch (e) {
      print('Error fetchBuktiMember: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void openFormAdd() {
    setState(() {
      isAddMode = true;
      selectedBukti = null;
      isFormVisible = true;
    });
  }

  void openFormEdit(mem.DatabaseMember bukti) {
    setState(() {
      isAddMode = false;
      selectedBukti = bukti;
      isFormVisible = true;
    });
  }

  void closeForm() {
    setState(() => isFormVisible = false);
    fetchBuktiMember(); // refresh list
  }

  void openDeletePopup(mem.DatabaseMember bukti) {
    setState(() {
      selectedBukti = bukti;
      isDeletePopupVisible = true;
    });
  }

  void closeDeletePopup() {
    setState(() => isDeletePopupVisible = false);
    fetchBuktiMember();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (isLoading) {
      yield div([text('Memuat bukti pembayaran...')]);
      return;
    }

    if (isFormVisible) {
      yield DatabaseBuktiForm(
        isAdd: isAddMode,
        member: component.member,
        bukti: selectedBukti,
        onClose: closeForm,
        showNotification: component.showNotification, // Tambahkan ini
      );
      return; // tidak render list jika sedang form
    }

    if (isDeletePopupVisible && selectedBukti != null) {
      yield DatabaseBuktiDeletePopup(
        bukti: selectedBukti!,
        onClose: closeDeletePopup,
        showNotification: component.showNotification, // Tambahkan ini
      );
      return;
    }
    
    yield div(classes: 'database-bukti-list', [
      h3([text('Daftar Bukti Pembayaran untuk: ${component.member.namaPelanggan}')]),
      if (buktiList.isEmpty) 
        div(
          classes: 'no-bukti-message',
          [text('Belum ada bukti pembayaran untuk member ini.')],
        )
      else
        table(classes: 'bukti-table', [
          thead([
            tr([
              th([text('Foto Bukti')]),
              th([text('Keterangan')]),
              th([text('Aksi')]),
            ]),
          ]),
          tbody([
            for (final bukti in buktiList)
              tr([
                td([
                  if (bukti.buktiPembayaran != null)
                    img(
                      src: bukti.buktiPembayaran,
                      alt: 'Bukti Pembayaran',
                      classes: 'bukti-image',
                    )
                  else
                    div([text('Belum ada foto')]),
                ]),
                td([text(bukti.keterangan)]),
                td([
                  button(
                    classes: 'edit-bukti',
                    onClick: () => openFormEdit(bukti),
                    [text('Edit')],
                  ),
                  button(
                    classes: 'delete-bukti',
                    onClick: () => openDeletePopup(bukti),
                    [text('Hapus')],
                  ),
                ]),
              ]),
          ]),
        ]),
      div(classes: 'bukti-list-buttons',[
        button(
        classes: 'close-bukti-list',
        onClick: component.onClose,
        [text('Kembali')],
        ),
        button(
          classes: 'add-bukti',
          onClick: openFormAdd,
          [text('+ Tambah Bukti')],
        ),
      ]),
    ]);
  }
}
