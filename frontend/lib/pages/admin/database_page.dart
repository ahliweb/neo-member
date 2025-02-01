import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/database_list.dart';

@client
class DatabasePage extends StatelessComponent {
  const DatabasePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // AdminLayout sebagai layout utama
    yield AdminLayout(
      child: div(
        classes: 'database-page',
        attributes: {'data-view': 'list'},
        [
          h1([text('Database Bukti Member')]),
          // Container utama, menampung DatabaseList
          DatabaseList(),
        ],
      ),
    );
  }
}
