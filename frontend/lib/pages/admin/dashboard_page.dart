import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/charts.dart';

class DashboardPage extends StatefulComponent {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'dashboard', [
        h1([text('Dashboard')]),
        div(classes: 'stats-container', [
          // Statistik
          div(classes: 'stat-card', [
            div(classes: 'stat-icon member', [
              img(src: '/images/member-icon.png', alt: 'Member Icon'),
            ]),
            h3([text('Total Member')]),
            h2([text('50,000')]),
          ]),
          div(classes: 'stat-card', [
            div(classes: 'stat-icon valid', [
              img(src: '/images/valid-icon.png', alt: 'Valid Icon'),
            ]),
            h3([text('Sudah Valid')]),
            h2([text('35,000')]),
          ]),
          div(classes: 'stat-card', [
            div(classes: 'stat-icon invalid', [
              img(src: '/images/invalid-icon.png', alt: 'Invalid Icon'),
            ]),
            h3([text('Belum Valid')]),
            h2([text('15,000')]),
          ]),
          div(classes: 'stat-card', [
            div(classes: 'stat-icon sales', [
              img(src: '/images/sales-icon.png', alt: 'Sales Icon'),
            ]),
            h3([text('Total Sales')]),
            h2([text('500')]),
          ]),
        ]),
        div(classes: 'chart-section', [
          div(classes: 'chart-header', [
            h3([text('Jumlah Member')]),
            div(classes: 'dropdown-container', [
              select(
                id: 'chart-type-dropdown',
                attributes: {'data-init': 'monthly'}, // Setel default
                [
                  option(value: 'monthly', [text('Per Bulan')]),
                  option(value: 'yearly', [text('Per Tahun')]),
                ],
              ),
              select(
                id: 'chart-period-dropdown',
                [] // Dropdown kedua kosong di awal
              ),
            ]),
          ]),
          const ChartComponent(),
        ]),
      ]),
    );
  }
}
