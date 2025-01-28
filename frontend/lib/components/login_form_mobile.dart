import 'package:jaspr/jaspr.dart';

class LoginFormMobile extends StatelessComponent {
  const LoginFormMobile({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'login-page-mobile', [
      img(src: '/images/logo.png', alt: 'Logo', classes: 'logo-mobile'),
      h1([text('Masuk ke Dashboard')]),
      div(classes: 'form-group-mobile', [
        label([text('ID')]),
        input(
          [],
          type: InputType.text,
          attributes: {'id': 'username-mobile', 'placeholder': 'Masukkan username anda'},
        ),
      ]),
      div(classes: 'form-group-mobile', [
        label([text('Password')]),
        div(classes: 'password-container', [
          input(
            [],
            type: InputType.password,
            attributes: {'id': 'password-mobile', 'placeholder': 'Masukkan password'},
          ),
          button(
            classes: 'password-toggle',
            attributes: {'id': 'toggle-password-mobile', 'type': 'button'},
            [
              img(
                src: '/images/eye-closed.png',
                alt: 'Toggle Password Visibility',
                classes: 'toggle-icon',
              ),
            ],
          ),
        ]),
      ]),
      button(
        classes: 'login-button',
        attributes: {'id': 'login-button-mobile'},
        [text('Masuk')],
      ),
      img(
        src: '/images/footer-login-mobile.png',
        alt: 'Footer Illustration',
        classes: 'footer-illustration',
      ),
    ]);
  }
}
