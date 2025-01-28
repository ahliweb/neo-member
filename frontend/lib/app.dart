import 'package:frontend/pages/sales/sales_informasi_page.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/about.dart';

import 'pages/login_page.dart';
import 'pages/admin/dashboard_page.dart';
import 'pages/admin/informasi_page.dart';
import 'pages/admin/formulir_page.dart';
import 'pages/admin/member_page.dart';
import 'pages/admin/broadcast_page.dart';
import 'pages/admin/sales_page.dart';
import 'pages/admin/database_page.dart';
import 'pages/member/mobile_informasi_page.dart';
import 'pages/member/mobile_profile_page.dart';
import 'pages/member/beranda_page.dart';
import 'pages/sales/sales_dashboard.dart';
import 'pages/sales/sales_upload.dart';
import 'pages/sales/sales_member_page.dart';
import 'pages/sales/sales_profile_page.dart';

// The main component of your application.
//
// By using multi-page routing, this component will only be built on the server during pre-rendering and
// **not** executed on the client. Instead only the nested [Home] and [About] components will be mounted on the client.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // This method is rerun every time the component is rebuilt.
    //
    // Each build method can return multiple child components as an [Iterable]. The recommended approach
    // is using the [sync* / yield] syntax for a streamlined control flow, but its also possible to simply
    // create and return a [List] here.

    // Renders a <div class="main"> html element with children.
    yield div(classes: 'main', [


      Router(routes: [
        Route(path: '/', title: 'Login', builder: (context, state) => LoginPage()),
        Route(path: '/about', title: 'About', builder: (context, state) => const About()),
        Route(path: '/login', title: 'Login', builder: (context, state) => LoginPage()),
        Route(path: '/dashboard', title: 'Dashboard', builder: (context, state) => DashboardPage()),
        Route(path: '/informasi', title: 'Informasi', builder: (context, state) => InformationPage()),
        Route(path: '/formulir', title: 'Formulir', builder: (context, state) => FormulirPage()),
        Route(path: '/member', title: 'Members', builder: (context, state) => MemberPage()),
        Route(path: '/broadcast', title: 'Broadcast', builder: (context, state) => BroadcastPage()),
        Route(path: '/sales', title: 'Sales', builder: (context, state) => SalesPage()),
        Route(path: '/database', title: 'Database', builder: (context, state) => DatabasePage()),
        Route(path: '/mobile-informasi', title: 'Mobile Informasi', builder: (context, state) => MobileInformasiPage()),
        Route(path: '/mobile-beranda', title: 'Mobile Beranda', builder: (context, state) => BerandaPage()),
        Route(path: '/mobile-profile', title: 'Mobile Profile', builder: (context, state) => MobileProfilePage()),
        Route(path: '/sales-beranda', title: 'Sales Beranda', builder: (context, state) => SalesDashboardPage()),
        Route(path: '/sales-upload', title: 'Sales Upload', builder: (context, state) => SalesUploadPage()),
        Route(path: '/sales-info', title: 'Sales Informasi', builder: (context, state) => SalesInformasiPage()),
        Route(path: '/sales-member', title: 'Sales Member', builder: (context, state) => SalesMemberPage()),
        Route(path: '/sales-profile', title: 'Sales Profile', builder: (context, state) => SalesProfilePage()),
      

      
      ]),
    ]);
  }

  // Defines the css styles for elements of this component.
  //
  // By using the @css annotation, these will be rendered automatically to css inside the <head> of your page.
  // Must be a variable or getter of type [List<StyleRule>].
  @css
  static final styles = [
    css('.main', [
      // The '&' refers to the parent selector of a nested style rules.
      css('&').box(height: 100.vh).flexbox(direction: FlexDirection.column, wrap: FlexWrap.wrap),
      css('section').flexItem(flex: Flex(grow: 1)).flexbox(
        direction: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
    ]),
  ];
}
