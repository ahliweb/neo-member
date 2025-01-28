import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/broadcast_table.dart';

class BroadcastPage extends StatelessComponent {
  const BroadcastPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'broadcast-page', [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/broadcast-handler.js'},
        ),
        h1([text('Broadcast')]),
        div(classes: 'broadcast-form', [
          textarea(
            [],
            id: 'broadcast-message',
            placeholder: 'Pesan',
            classes: 'broadcast-message',
          ),
          div(classes: 'filter-buttons', [
            button(classes: 'filter-button active', [text('Semua')]),
            button(classes: 'filter-button', [text('Sales')]),
            button(classes: 'filter-button', [text('Member')]),
          ]),
        ]),
        BroadcastTable(), // Table component for broadcast
        button(classes: 'send-button', [text('KIRIM PESAN')]),
      ]),
    );
  }
}
