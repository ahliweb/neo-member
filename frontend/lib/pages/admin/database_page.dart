import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/database_list.dart';
import '../../components/admin/ktp_popup.dart';
import '../../components/admin/payment_popup.dart';

class DatabasePage extends StatelessComponent {
  const DatabasePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'database-page', attributes: {'data-view': 'list'}, [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/database-handler.js'},
        ),
        div(classes: 'header-with-search', [
          h1([text('Database')]),
          input(
            [],
            type: InputType.text,
            attributes: {'placeholder': 'Cari'},
            classes: 'search-input',
          ),
        ]),
        DatabaseList(),
        KtpPopup(),
        PaymentPopup(),
      ]),
    );
  }
}
