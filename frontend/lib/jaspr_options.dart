// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/admin/admin_layout.dart' as prefix0;
import 'package:frontend/components/admin/charts.dart' as prefix1;
import 'package:frontend/components/admin/information_list.dart' as prefix2;
import 'package:frontend/pages/admin/formulir_page.dart' as prefix3;
import 'package:frontend/pages/admin/member_page.dart' as prefix4;
import 'package:frontend/pages/admin/sales_page.dart' as prefix5;
import 'package:frontend/pages/about.dart' as prefix6;
import 'package:frontend/pages/home.dart' as prefix7;
import 'package:frontend/app.dart' as prefix8;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
final defaultJasprOptions = JasprOptions(
  clients: {
    prefix1.ChartComponent: ClientTarget<prefix1.ChartComponent>('components/admin/charts'),
    prefix2.InformationList: ClientTarget<prefix2.InformationList>('components/admin/information_list'),
    prefix6.About: ClientTarget<prefix6.About>('pages/about'),
    prefix3.FormulirPage: ClientTarget<prefix3.FormulirPage>('pages/admin/formulir_page'),
    prefix4.MemberPage: ClientTarget<prefix4.MemberPage>('pages/admin/member_page'),
    prefix5.SalesPage: ClientTarget<prefix5.SalesPage>('pages/admin/sales_page'),
    prefix7.Home: ClientTarget<prefix7.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.AdminLayout.styles,
    ...prefix6.About.styles,
    ...prefix8.App.styles,
  ],
);
