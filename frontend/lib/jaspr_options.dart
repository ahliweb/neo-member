// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/admin/admin_layout.dart' as prefix0;
import 'package:frontend/components/admin/charts.dart' as prefix1;
import 'package:frontend/components/admin/information_list.dart' as prefix2;
import 'package:frontend/pages/admin/dashboard_page.dart' as prefix3;
import 'package:frontend/pages/admin/database_page.dart' as prefix4;
import 'package:frontend/pages/admin/formulir_page.dart' as prefix5;
import 'package:frontend/pages/admin/member_page.dart' as prefix6;
import 'package:frontend/pages/admin/sales_page.dart' as prefix7;
import 'package:frontend/pages/about.dart' as prefix8;
import 'package:frontend/pages/home.dart' as prefix9;
import 'package:frontend/app.dart' as prefix10;

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
    prefix1.ChartDartComponent: ClientTarget<prefix1.ChartDartComponent>('components/admin/charts'),
    prefix2.InformationList: ClientTarget<prefix2.InformationList>('components/admin/information_list'),
    prefix8.About: ClientTarget<prefix8.About>('pages/about'),
    prefix3.DashboardPage: ClientTarget<prefix3.DashboardPage>('pages/admin/dashboard_page'),
    prefix4.DatabasePage: ClientTarget<prefix4.DatabasePage>('pages/admin/database_page'),
    prefix5.FormulirPage: ClientTarget<prefix5.FormulirPage>('pages/admin/formulir_page'),
    prefix6.MemberPage: ClientTarget<prefix6.MemberPage>('pages/admin/member_page'),
    prefix7.SalesPage: ClientTarget<prefix7.SalesPage>('pages/admin/sales_page'),
    prefix9.Home: ClientTarget<prefix9.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.AdminLayout.styles,
    ...prefix8.About.styles,
    ...prefix10.App.styles,
  ],
);
