import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class LayoutSales extends StatelessComponent {
  final String pageTitle;
  final Component child;

  const LayoutSales({
    required this.pageTitle,
    required this.child,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.binding.currentUri.path;

    yield DomComponent(
      tag: 'div',
      classes: 'layout-sales',
      children: [
        if (pageTitle.isNotEmpty) // Only render the header if pageTitle is not empty
          DomComponent(
            tag: 'header',
            classes: 'sales-header',
            children: [
              text(pageTitle),
            ],
          ),
        DomComponent(
          tag: 'main',
          classes: 'sales-content',
          children: [child],
        ),
        DomComponent(
          tag: 'footer',
          classes: 'sales-footer',
          children: [
            Link(
              to: '/sales-beranda',
              child: div(classes: 'footer-button ${activePath == '/sales-beranda' ? 'active' : ''}', [
                img(
                  src: '/images/mobile-home-icon.png',
                  alt: 'Home Icon',
                  classes: 'footer-icon',
                ),
              ]),
            ),
            Link(
              to: '/sales-upload',
              child: div(classes: 'footer-button ${activePath == '/sales-upload' ? 'active' : ''}', [
                img(
                  src: '/images/upload-icon.png',
                  alt: 'Form Icon',
                  classes: 'footer-icon',
                ),
              ]),
            ),
            Link(
              to: '/sales-info',
              child: div(classes: 'footer-button ${activePath == '/sales-info' ? 'active' : ''}', [
                img(
                  src: '/images/mobile-info-icon.png',
                  alt: 'Info Icon',
                  classes: 'footer-icon',
                ),
              ]),
            ),
            Link(
              to: '/sales-member',
              child: div(classes: 'footer-button ${activePath == '/sales-member' ? 'active' : ''}', [
                img(
                  src: '/images/member-icon.png',
                  alt: 'Member Icon',
                  classes: 'footer-icon',
                ),
              ]),
            ),
            Link(
              to: '/sales-profile',
              child: div(classes: 'footer-button ${activePath == '/sales-profile' ? 'active' : ''}', [
                img(
                  src: '/images/person.png',
                  alt: 'Profile Icon',
                  classes: 'footer-icon',
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
