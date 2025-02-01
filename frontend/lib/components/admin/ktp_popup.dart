import 'package:jaspr/jaspr.dart';

class KtpPopup extends StatelessComponent {
  final String ktpUrl;
  final VoidCallback onClose;

  const KtpPopup({
    required this.ktpUrl,
    required this.onClose,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'ktp-popup-overlay',
      events: {
        'click': (_) => onClose(),
      },
      [
        div(
          classes: 'ktp-popup-content',
          events: {'click': (event) => event.preventDefault()}, // agar klik di dalam popup tidak menutup
          [
            img(
              src: ktpUrl,
              alt: 'KTP',
              classes: 'ktp-popup-image',
            ),
            button(
              classes: 'close-button',
              onClick: onClose,
              [],
            ),
          ],
        ),
      ],
    );
  }
}
