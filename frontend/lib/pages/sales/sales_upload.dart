import 'package:jaspr/jaspr.dart';
import '../../components/sales/sales_layout.dart';

class SalesUploadPage extends StatelessComponent {
  const SalesUploadPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield LayoutSales(
      pageTitle: 'Upload Dokumen',
      child: div([
        // Include Choices.js CSS
        DomComponent(
          tag: 'link',
          attributes: {
            'rel': 'stylesheet',
            'href': 'https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css',
          },
        ),
        // Include Choices.js JavaScript
        DomComponent(
          tag: 'script',
          attributes: {
            'src': 'https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js',
          },
        ),
        // Include your custom CSS
        DomComponent(
          tag: 'link',
          attributes: {
            'rel': 'stylesheet',
            'href': '/styles/mobile-sales-upload.css',
          },
        ),
        // Include your custom JavaScript
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/mobile-sales-handler.js'},
        ),
        // Main content
        div(classes: 'upload-page', [
          // Tab Navigation
          div(classes: 'tab-container', [
            button(
              id: 'upload-ktp-button',
              classes: 'tab-button',
              [text('Upload KTP')],
            ),
            button(
              id: 'upload-payment-button',
              classes: 'tab-button',
              [text('Upload Bukti Pembayaran')],
            ),
          ]),
          // Tab Content
          div(classes: 'tab-content', [
            div(classes: 'sales-upload-ktp-form', [
              div(classes: 'upload-container', [
                div(classes: 'upload-card', [
                  img(src: '/images/upload-icon.png', alt: 'Upload Icon'),
                  p([text('Upload KTP')]),
                ]),
              ]),
              div(classes: 'form-container', [
                label([text('Member')]),
                select(classes: 'dropdown', [
                  for (var member in ['Aditya Permana', 'John Doe', 'Alice Smith'])
                    option([text(member)]),
                ]),
              ]),
              button(classes: 'submit-button', [text('Kirim')]),
            ]),
            div(classes: 'sales-upload-payment-form', [
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
            ]),
          ]),
        ]),
      ]),
    );
  }
}
