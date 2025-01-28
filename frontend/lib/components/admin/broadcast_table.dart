import 'package:jaspr/jaspr.dart';

class BroadcastTable extends StatelessComponent {
  const BroadcastTable({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield table(classes: 'broadcast-table', [
      thead([
        tr([
          th([
            input([], type: InputType.checkbox, classes: 'select-all-checkbox'),
          ]),
          th([text('NAMA')]),
          th([text('No. WhatsApp')]),
          th([text('Alamat')]),
        ]),
      ]),
      tbody([
        for (var i = 0; i < 4; i++)
          tr(
            attributes: {'data-tag': i % 2 == 0 ? 'Sales' : 'Member'},
            [
              td([
                input([], type: InputType.checkbox, classes: 'select-checkbox'),
              ]),
              td([text(i % 2 == 0 ? 'Agus Sutikno' : 'Aditya Kyungso')]),
              td([text('082146591205')]),
              td([text('Lorem ipsum dolor sit amet consectetur.')]),
            ],
          ),
      ]),
    ]);
  }
}
