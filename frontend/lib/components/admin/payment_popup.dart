import 'package:jaspr/jaspr.dart';

class PaymentPopup extends StatelessComponent {
  const PaymentPopup({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'popup-container payment-popup', [
      div(classes: 'popup-content', [
        button(classes: 'carousel-prev', [text('<')]),
        div(classes: 'carousel-image-container', [
          img(
            src: '/images/payment1.png',
            alt: 'Payment Image',
            classes: 'carousel-image',
          ),
        ]),
        button(classes: 'carousel-next', [text('>')]),
      ]),
      // Thumbnail container moved here
      div(classes: 'carousel-thumbnails', [
        for (var i = 1; i <= 5; i++)
          img(
            src: '/images/payment$i.png',
            alt: 'Payment Thumbnail $i',
            classes: i == 1 ? 'thumbnail active' : 'thumbnail',
            attributes: {'data-index': '$i'},
          ),
      ]),
      button(classes: 'close-button', [text('X')]),
    ]);
  }
}
