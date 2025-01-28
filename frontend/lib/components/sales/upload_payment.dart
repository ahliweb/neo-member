import 'package:jaspr/jaspr.dart';

class SalesUploadPaymentForm extends StatelessComponent {
  const SalesUploadPaymentForm({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'tab-content', [
      div(classes: 'upload-container', [
        div(classes: 'upload-card', [
          img(src: '/images/upload-icon.png', alt: 'Upload Icon'),
          p([text('Upload Bukti Pembayaran')]),
        ]),
      ]),
      div(classes: 'form-container', [
        label([text('Member')]),
        select(classes: 'dropdown', [
          for (var member in ['Aditya Permana', 'John Doe', 'Alice Smith'])
            option([text(member)]),
        ]),
        label([text('Keterangan')]),
        textarea([], classes: 'textarea', attributes: {'placeholder': 'Isi keterangan'}),
      ]),
      button(classes: 'submit-button', [text('Kirim')]),
    ]);
  }
}
