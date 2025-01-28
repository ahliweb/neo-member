import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/information_list.dart';
import '../../components/admin/information_form.dart';
import '../../components/admin/information_delete_popup.dart';

class InformationPage extends StatelessComponent {
  const InformationPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'information-page', attributes: {'data-view': 'list'}, [
        // DomComponent(
        //   tag: 'script',
        //   attributes: {'src': '/scripts/info-handler.js'}, // JavaScript untuk interaksi
        // ),
        h1([text('Informasi')]),
        InformationList(), // Komponen List
        // InformationForm(), // Komponen Form
        // InformationDeletePopup(), // Komponen Delete Popup
      ]),
    );
  }
}
