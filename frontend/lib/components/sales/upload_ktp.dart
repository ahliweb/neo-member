import 'package:jaspr/jaspr.dart';

class SalesUploadKTPForm extends StatelessComponent {
  const SalesUploadKTPForm({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'tab-content', [
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
    ]);
  }
}
