import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/member/member_layout.dart';

class MobileProfilePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'script',
      attributes: {'src': '/scripts/mobile-profile-handler.js'},
    );

    yield LayoutMember(
      pageTitle: 'Profil',
      child: div(classes: 'mobile-profile-page', [
        div(classes: 'mobile-profile-card', [
          img(
            src: '/images/profile.png',
            alt: 'Profile Picture',
            classes: 'mobile-profile-avatar',
          ),
          h2([text('Nama Member')]),
          div(classes: 'mobile-profile-details', [
            div(classes: 'mobile-profile-row', [
              p(classes: 'mobile-profile-label', [text('Tanggal Mulai Membership:')]),
              p(classes: 'mobile-profile-value', [text('01 Januari 2023')]),
            ]),
            div(classes: 'mobile-profile-row', [
              p(classes: 'mobile-profile-label', [text('Nama Sales:')]),
              p(classes: 'mobile-profile-value', [text('Aditya')]),
            ]),
            div(classes: 'mobile-profile-row', [
              p(classes: 'mobile-profile-label', [text('Status:')]),
              p(classes: 'mobile-profile-value', [
                span(classes: 'mobile-status valid', [text('Valid')])
              ]),
            ]),
          ]),
          button(
            classes: 'mobile-logout-button',
            attributes: {'id': 'logout-button'},
            [text('Keluar')],
          ),
        ]),
      ]),
    );
  }
}
