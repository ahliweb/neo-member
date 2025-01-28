import 'package:jaspr/jaspr.dart';

class SalesDeletePopup extends StatelessComponent {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final void Function(String, bool) showNotification;

  const SalesDeletePopup({
    required this.onConfirm,
    required this.onCancel,
    required this.showNotification,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'delete-popup-overlay', [
      div(classes: 'delete-popup', [
        h3([text('Apakah Anda yakin ingin menghapus data sales ini?')]),
        div(classes: 'popup-actions', [
          button(
            classes: 'confirm-button',
            onClick: () {
              try {
                onConfirm(); // Proses delete
                showNotification('Sales berhasil dihapus.', true); // Tampilkan notifikasi sukses
              } catch (e) {
                showNotification('Gagal menghapus sales: $e', false); // Tampilkan notifikasi error
              }
            },
            [text('Hapus')],
          ),
          button(classes: 'cancel-button', onClick: onCancel, [text('Batal')]),
        ]),
      ]),
    ]);
  }
}
