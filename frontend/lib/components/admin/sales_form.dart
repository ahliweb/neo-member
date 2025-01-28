import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as sal;

class SalesForm extends StatefulComponent {
  final sal.Sales? sales;
  final void Function(sal.Sales) onSubmit;
  final VoidCallback onCancel;
  final List<sal.Sales> existingSalesList; // Daftar sales yang ada
  final void Function(String message, bool isSuccess) showNotification; // Fungsi notifikasi

  const SalesForm({
    this.sales,
    required this.onSubmit,
    required this.onCancel,
    required this.existingSalesList,
    required this.showNotification,
    super.key,
  });

  @override
  State<SalesForm> createState() => _SalesFormState();
}

class _SalesFormState extends State<SalesForm> {
  late String name;
  late String nik;
  late String whatsapp;
  late bool isEdit; // Tambahkan variabel isEdit

  @override
  void initState() {
    super.initState();
    name = component.sales?.namaSales ?? '';
    nik = component.sales?.nik ?? '';
    whatsapp = component.sales?.noWhatsapp ?? '';
    isEdit = component.sales != null; // Tentukan apakah ini edit mode atau tambah
  }

  bool isNikUnique(String nik) {
    return component.existingSalesList.every((sales) =>
        sales.nik != nik || (isEdit && sales.id == component.sales?.id));
  }

  void handleSubmit() {
    if (!isNikUnique(nik)) {
      component.showNotification('NIK sudah digunakan oleh sales lain.', false);
      return;
    }

    component.showNotification(isEdit ? 'Sales berhasil diedit' : 'Sales berhasil ditambahkan', true);

    final newSales = sal.Sales(
      id: component.sales?.id,
      namaSales: name,
      nik: nik,
      noWhatsapp: whatsapp,
    );
    component.onSubmit(newSales);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'sales-form', [
      // Tambahkan judul berdasarkan mode
      h3([text(isEdit ? 'Edit Sales' : 'Tambah Sales')]),
      div(classes: 'form-group', [
        label(classes: 'form-label', [text('Nama Sales')]),
        input(
          [],
          classes: 'form-input',
          value: name,
          onInput: (value) => setState(() => name = value as String),
        ),
      ]),
      div(classes: 'form-group', [
        label(classes: 'form-label', [text('NIK')]),
        input(
          [],
          classes: 'form-input',
          value: nik,
          onInput: (value) => setState(() => nik = value as String),
        ),
      ]),
      div(classes: 'form-group', [
        label(classes: 'form-label', [text('No. WhatsApp')]),
        input(
          [],
          classes: 'form-input',
          value: whatsapp,
          onInput: (value) => setState(() => whatsapp = value as String),
        ),
      ]),
      div(classes: 'form-actions', [
        button(
          classes: 'submit-button',
          onClick: handleSubmit,
          [text('SIMPAN')],
        ),
        button(
          classes: 'cancel-button',
          onClick: component.onCancel,
          [text('BATAL')],
        ),
      ]),
    ]);
  }
}
