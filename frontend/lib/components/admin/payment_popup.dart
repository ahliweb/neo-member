import 'package:jaspr/jaspr.dart';

class PaymentPopup extends StatefulComponent {
  final List<String> paymentUrls;
  final List<String> paymentDescriptions; // Tambahkan daftar keterangan
  final int currentIndex;
  final VoidCallback onClose;

  const PaymentPopup({
    required this.paymentUrls,
    required this.paymentDescriptions,
    required this.currentIndex,
    required this.onClose,
    super.key,
  });

  @override
  State<StatefulComponent> createState() => _PaymentPopupState();
}

class _PaymentPopupState extends State<PaymentPopup> {
  late int currentPaymentIndex;

  @override
  void initState() {
    super.initState();
    currentPaymentIndex = component.currentIndex;
  }

  void nextImage() {
    if (currentPaymentIndex < component.paymentUrls.length - 1) {
      setState(() => currentPaymentIndex++);
    }
  }

  void prevImage() {
    if (currentPaymentIndex > 0) {
      setState(() => currentPaymentIndex--);
    }
  }

  void selectImage(int index) {
    setState(() => currentPaymentIndex = index);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'payment-popup-overlay',
      events: {'click': (_) => component.onClose()},
      [
        div(
          classes: 'payment-popup-content',
          events: {'click': (evt) => evt.preventDefault()},
          [
            // Jika tidak ada bukti pembayaran, tampilkan pesan
            if (component.paymentUrls.isEmpty)
              div(classes: 'payment-no-data', [
                text('Belum ada bukti pembayaran'),
              ])
            else ...[
              // Gambar utama
              div(classes: 'carousel-image-container', [
                img(
                  src: component.paymentUrls[currentPaymentIndex],
                  alt: 'Payment',
                  classes: 'payment-image',
                ),
              ]),

              // Keterangan Bukti Pembayaran
              div(classes: 'payment-description', [
                text(component.paymentDescriptions[currentPaymentIndex]), // Tampilkan deskripsi
              ]),

              // Tombol Next & Prev
              div(classes: 'carousel-controls', [
                if (currentPaymentIndex > 0)
                  button(
                    classes: 'carousel-prev',
                    events: {
                    'click': (evt) {
                      evt.preventDefault(); // Mencegah penutupan popup
                      prevImage();
                    }
                  },
                    [text('<')],
                  ),
                if (currentPaymentIndex < component.paymentUrls.length - 1)
                  button(
                    classes: 'carousel-next',
                    events: {
                    'click': (evt) {
                      evt.preventDefault(); // Mencegah penutupan popup
                      nextImage();
                    }
                  },
                    [text('>')],
                  ),
              ]),

              // Thumbnail Navigation
              div(classes: 'carousel-thumbnails', [
                for (int i = 0; i < component.paymentUrls.length; i++)
                  img(
                    src: component.paymentUrls[i],
                    alt: 'Thumbnail',
                    classes: 'thumbnail ${i == currentPaymentIndex ? "active" : ""}',
                    events: {
                      'click': (evt) {
                        evt.preventDefault();
                        selectImage(i);
                      }
                    },
                  ),
              ]),
            ],

            // Tombol Tutup
            button(
              classes: 'close-button',
              onClick: component.onClose,
              [],
            ),
          ],
        ),
      ],
    );
  }
}
