import 'package:jaspr/jaspr.dart';
import 'sidebar.dart';
import 'navbar.dart';

class AdminLayout extends StatelessComponent {
  final Component child; // Halaman admin di dalam layout
  final String title;

  const AdminLayout({super.key, required this.child, this.title = 'Admin Panel'});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'admin-layout', [
      const Sidebar(),
      div(classes: 'content-area', [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/navbar-handler.js'},
        ),
        Navbar(title: title),
        div(classes: 'page-content', [child]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.admin-layout', [
      css('&').flexbox(direction: FlexDirection.row).box(height: 100.vh),
      css('.content-area').flexItem(flex: const Flex(grow: 1)).flexbox(direction: FlexDirection.column),
      css('.page-content').flexItem(flex: const Flex(grow: 1)).box(padding: EdgeInsets.all(16.px)),
    ]),
  ];
}
