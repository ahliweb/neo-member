import 'package:jaspr/jaspr.dart';

@client
class ChartComponent extends StatelessComponent {
  const ChartComponent({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      attributes: {'id': 'chart-container'},
      children: [
        DomComponent(
          tag: 'canvas',
          attributes: {'id': 'chart-member', 'width': '800', 'height': '400'},
        ),
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/chart-handler.js'}, // Jalur ke file JavaScript
        ),
      ],
    );
  }
}
