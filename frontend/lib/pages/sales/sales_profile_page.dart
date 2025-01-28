import 'package:jaspr/jaspr.dart';
import '../../components/sales/sales_layout.dart';

class SalesProfilePage extends StatelessComponent {
  const SalesProfilePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'script',
      attributes: {'src': '/scripts/mobile-profile-handler.js'},
    );
    yield LayoutSales(
      pageTitle: 'Profil Sales',
      child: div(classes: 'sales-profile-page', [
        div(classes: 'sales-profile-card', [
          img(
            src: '/images/profile.png',
            alt: 'Profile Picture',
            classes: 'sales-profile-avatar',
          ),
          div(classes: 'sales-profile-detail', [
            div(classes: 'profile-row', [
              span(classes: 'label', [text('Nama:')]),
              span(classes: 'value', [text('Aditya')]),
            ]),
            div(classes: 'profile-row', [
              span(classes: 'label', [text('Email:')]),
              span(classes: 'value', [text('aditya@example.com')]),
            ]),
            div(classes: 'profile-row', [
              span(classes: 'label', [text('Jumlah Member:')]),
              span(classes: 'value', [text('150')]),
            ]),
            div(classes: 'profile-row', [
              span(classes: 'label', [text('Tanggal Bergabung:')]),
              span(classes: 'value', [text('01 Januari 2020')]),
            ]),
          ]),
        ]),
        button(
          classes: 'logout-button',
          attributes: {'id': 'logout-button'},
          [text('Keluar')],
        ),
      ]),
    );
  }
}
