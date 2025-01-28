// confirmation_dialog.dart
import 'package:jaspr/jaspr.dart';

class ConfirmationDialog extends StatelessComponent {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'dialog-overlay', [
      div(classes: 'dialog-box', [
        h3([text(title)]),
        p([text(content)]),
        div(classes: 'dialog-actions', [
          button(
            classes: 'confirm-button',
            [text('Ya')],
            onClick: onConfirm,
          ),
          button(
            classes: 'cancel-button',
            [text('Tidak')],
            onClick: onCancel,
          ),
        ]),
      ]),
    ]);
  }
}
