import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/charts.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

@client
class DashboardPage extends StatefulComponent {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final client = mem.Client('http://localhost:8080/');
  
  bool isLoading = false;
  int totalMember = 0;
  int validMember = 0;
  int invalidMember = 0;
  int totalSales = 0;

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  Future<void> fetchStats() async {
    setState(() => isLoading = true);
    try {
      final dashboard = client.dashboard;
      final tm = await dashboard.getTotalMembers();
      final vm = await dashboard.getValidMembers();
      final sc = await dashboard.getSalesCount();
      
      setState(() {
        totalMember = tm;
        validMember = vm;
        totalSales = sc;
        invalidMember = tm - vm;
      });
    } catch (e) {
      print('Error fetching stats: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'dashboard', [
        h1([text('Dashboard')]),
        if (isLoading)
          div([text('Memuat data...')])
        else
          div(classes: 'stats-container', [
            // Stat cards
            div(classes: 'stat-card', [
              div(classes: 'stat-icon member', [
                img(src: '/images/member-icon.png', alt: 'Member Icon'),
              ]),
              h3([text('Total Member')]),
              h2([text(totalMember.toString())]),
            ]),
            div(classes: 'stat-card', [
              div(classes: 'stat-icon valid', [
                img(src: '/images/valid-icon.png', alt: 'Valid Icon'),
              ]),
              h3([text('Sudah Valid')]),
              h2([text(validMember.toString())]),
            ]),
            div(classes: 'stat-card', [
              div(classes: 'stat-icon invalid', [
                img(src: '/images/invalid-icon.png', alt: 'Invalid Icon'),
              ]),
              h3([text('Belum Valid')]),
              h2([text(invalidMember.toString())]),
            ]),
            div(classes: 'stat-card', [
              div(classes: 'stat-icon sales', [
                img(src: '/images/sales-icon.png', alt: 'Sales Icon'),
              ]),
              h3([text('Total Sales')]),
              h2([text(totalSales.toString())]),
            ]),
          ]),
        // Chart Container
        div(classes: 'chart-container', [
          h3([text('Jumlah Member')]),
          ChartDartComponent(),
        ]),
      ]),
    );
  }
}
