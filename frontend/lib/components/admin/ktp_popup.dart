import 'package:jaspr/jaspr.dart';

class KtpPopup extends StatelessComponent {
  const KtpPopup({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'popup-container ktp-popup', [
      div(classes: 'popup-content', [
        img(
          src: '/images/ktp.png',
          alt: 'KTP Image',
          classes: 'popup-ktp-image',
        ),
        button(classes: 'close-button', [text('X')]),
      ]),
    ]);
  }
}
