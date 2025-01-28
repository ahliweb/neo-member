import 'package:jaspr/jaspr.dart';

class Navbar extends StatelessComponent {
  final String title;

  const Navbar({super.key, this.title = 'Admin Panel'});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield header(classes: 'navbar', [
      h2([text(title)]),
      div(classes: 'navbar-actions', [
        div(classes: 'notification', [
          img(src: '/images/notification-icon.png', alt: 'Notification'),
          span(classes: 'badge', [text('6')]),
        ]),
        div(classes: 'profile', [
          img(src: '/images/profile.png', alt: 'Profile', classes: 'profile-pic'),
          span([text('Noesantara')]),
          img(src: '/images/dropdown-icon.png', alt: 'Dropdown', classes: 'dropdown-icon'),
          div(classes: 'dropdown-menu', [
            button(classes: 'dropdown-item logout-button', [text('Logout')]),
          ]),
        ]),
      ]),
    ]);
  }
}
