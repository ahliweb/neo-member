import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Sidebar extends StatelessComponent {
  const Sidebar({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.binding.currentUri.path;

    yield nav(classes: 'sidebar', [
      div(classes: 'sidebar-header', [
        img(classes: 'logo', src: '/images/logo.png', alt: 'Logo'),
        h1(classes: 'brand-title', [text('NoeSantara')]),
      ]),
      div(classes: 'menu-section', [
        ul(classes: 'sidebar-menu', [
          li(classes: 'menu-item ${activePath == '/dashboard' ? 'active' : ''}', [
            Link(to: '/dashboard', child: div(classes: 'menu-content', [
              img(src: '/images/dashboard-icon.png', alt: 'Dashboard Icon', classes: 'menu-icon'),
              span([text('Dashboard')]),
            ])),
          ]),
          li(classes: 'menu-item ${activePath == '/informasi' ? 'active' : ''}', [
            Link(to: '/informasi', child: div(classes: 'menu-content', [
              img(src: '/images/informasi-icon.png', alt: 'Informasi Icon', classes: 'menu-icon'),
              span([text('Informasi')]),
            ])),
          ]),
          li(classes: 'menu-item ${activePath == '/formulir' ? 'active' : ''}', [
            Link(to: '/formulir', child: div(classes: 'menu-content', [
              img(src: '/images/formulir-icon.png', alt: 'Formulir Icon', classes: 'menu-icon'),
              span([text('Formulir')]),
            ])),
          ]),
        ]),
      ]),
      div(classes: 'menu-section', [
        p(classes: 'menu-section-title', [text('Pages')]),
        ul(classes: 'sidebar-menu', [
          li(classes: 'menu-item ${activePath == '/member' ? 'active' : ''}', [
            Link(to: '/member', child: div(classes: 'menu-content', [
              img(src: '/images/member-icon.png', alt: 'Member Icon', classes: 'menu-icon'),
              span([text('Member')]),
            ])),
          ]),
          li(classes: 'menu-item ${activePath == '/sales' ? 'active' : ''}', [
            Link(to: '/sales', child: div(classes: 'menu-content', [
              img(src: '/images/sales-icon.png', alt: 'Sales Icon', classes: 'menu-icon'),
              span([text('Sales')]),
            ])),
          ]),
          li(classes: 'menu-item ${activePath == '/broadcast' ? 'active' : ''}', [
            Link(to: '/broadcast', child: div(classes: 'menu-content', [
              img(src: '/images/broadcast-icon.png', alt: 'Broadcast Icon', classes: 'menu-icon'),
              span([text('Broadcast')]),
            ])),
          ]),
          li(classes: 'menu-item ${activePath == '/database' ? 'active' : ''}', [
            Link(to: '/database', child: div(classes: 'menu-content', [
              img(src: '/images/database-icon.png', alt: 'Database Icon', classes: 'menu-icon'),
              span([text('Database')]),
            ])),
          ]),
        ]),
      ]),
    ]);
  }
}
