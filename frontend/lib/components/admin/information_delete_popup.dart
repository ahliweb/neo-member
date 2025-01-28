import 'package:jaspr/jaspr.dart';

class InformationDeletePopup extends StatelessComponent {
  final int deleteId;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const InformationDeletePopup({
    required this.deleteId,
    required this.onDelete,
    required this.onCancel,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'info-delete-popup-overlay', [
      div(classes: 'info-delete-popup', [
        h3([text('Apakah anda yakin ingin menghapus informasi ini?')]),
        p([text('ID Informasi: $deleteId')]),
        div(classes: 'popup-actions', [
          button(
            id: 'confirm-delete-button',
            classes: 'delete-button',
            [text('Hapus')],
            onClick: onDelete,
          ),
          button(
            id: 'cancel-delete-button',
            classes: 'cancel-button',
            [text('Batal')],
            onClick: onCancel,
          ),
        ]),
      ]),
    ]);
  }
}
