import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class LayoutMember extends StatelessComponent {
  final String pageTitle;
  final Component child;

  const LayoutMember({
    required this.pageTitle,
    required this.child,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.binding.currentUri.path;

    yield DomComponent(
      tag: 'div',
      classes: 'layout-member',
      children: [
        DomComponent(
          tag: 'header',
          classes: 'member-header',
          children: [
            h1([text(pageTitle)]),
          ],
        ),
        DomComponent(
          tag: 'main',
          classes: 'member-content',
          children: [child],
        ),
        DomComponent(
          tag: 'footer',
          classes: 'member-footer',
          children: [
            Link(
              to: '/mobile-beranda',
              child: div(
                attributes: {'class': 'footer-button ${activePath == '/mobile-beranda' ? 'active' : ''}'},
                [
                  DomComponent(
                    tag: 'img',
                    attributes: {
                      'src': '/images/mobile-home-icon.png',
                      'alt': 'Beranda',
                    },
                    classes: 'footer-icon',
                  ),
                ],
              ),
            ),
            Link(
              to: '/mobile-informasi',
              child: div(
                classes: 'footer-button ${activePath == '/mobile-informasi' ? 'active' : ''}',
                [
                  DomComponent(
                    tag: 'img',
                    attributes: {
                      'src': '/images/mobile-info-icon.png',
                      'alt': 'Informasi',
                    },
                    classes: 'footer-icon',
                  ),
                ],
              ),
            ),
            Link(
              to: '/mobile-profile',
              child: div(
                classes: 'footer-button ${activePath == '/mobile-profile' ? 'active' : ''}',
                [
                  DomComponent(
                    tag: 'img',
                    attributes: {
                      'src': '/images/person.png',
                      'alt': 'Profil',
                    },
                    classes: 'footer-icon',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
