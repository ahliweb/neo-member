import 'package:jaspr/jaspr.dart';

class LoginForm extends StatelessComponent {
  const LoginForm({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'login-container', [
      img(src: '/images/logo.png', alt: 'Logo', classes: 'logo'),
      h1([text('Masuk ke Dashboard')]),
      p([text('Please enter your email and password to continue')]),
      div(classes: 'form-group', [
        label([text('Id :')]),
        input(
          [],
          type: InputType.text,
          attributes: {'id': 'username', 'placeholder': 'Admin12345'},
        ),
      ]),
      div(classes: 'form-group', [
        label([text('Password')]),
        div(classes: 'password-container', [
          input(
            [],
            type: InputType.password,
            attributes: {'id': 'password', 'placeholder': '******'},
          ),
          button(
            classes: 'password-toggle',
            attributes: {'id': 'toggle-password', 'type': 'button'},
            [text('👁️')], // You can use an eye icon here
          ),
        ]),
      ]),
      div(classes: 'form-group remember-password', [
        input(
          [],
          type: InputType.checkbox,
          attributes: {'id': 'remember-password'},
        ),
        span([text('Remember Password')]),
      ]),
      button(
        classes: 'login-button',
        attributes: {'id': 'login-button'},
        [text('Masuk')],
      ),
    ]);
  }
}
