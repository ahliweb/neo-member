import 'package:frontend/components/login_form_desktop.dart';
import 'package:jaspr/jaspr.dart';
import '../../components/login_form_mobile.dart';

class LoginPage extends StatelessComponent {
  const LoginPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      classes: 'login-page',
      attributes: {'data-device': 'desktop'}, // Default value, updated dynamically
      children: [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/login-handler.js'}, // JavaScript to handle UI logic
        ),
        DomComponent(
          tag: 'div',
          children: [
            DomComponent(
              tag: 'div',
              attributes: {'id': 'desktop-login-container'}, // Desktop container
              children: [const LoginFormDesktop()],
            ),
            DomComponent(
              tag: 'div',
              attributes: {'id': 'mobile-login-container'}, // Mobile container
              children: [const LoginFormMobile()],
            ),
          ],
        ),
      ],
    );
  }
}
