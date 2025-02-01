import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;
import 'package:universal_html/html.dart' as html;
import 'dart:math';
import 'dart:async';

@client
class ChartDartComponent extends StatefulComponent {
  const ChartDartComponent({super.key});

  @override
  State createState() => _ChartDartComponentState();
}

class _ChartDartComponentState extends State<ChartDartComponent> {
  final client = mem.Client('http://localhost:8080/');

  String mode = 'yearly'; // monthly / yearly
  String period = '2023'; // default
  Map<String, int> chartData = {};

  @override
  void initState() {
    super.initState();
    fetchChartData(); // load awal
  }

  Future<void> fetchChartData() async {
    try {
      final data = await client.dashboard.getMemberChartData(
        mode: mode,
        period: period,
      );
      setState(() {
        chartData = data;
      });
      drawChart();
    } catch (e) {
      print('Error fetching chart data: $e');
    }
  }

  void drawChart() {
    // Ambil canvas
    final canvas = html.document.querySelector('#chart-member') as html.CanvasElement?;
    if (canvas == null) return;

    final ctx = canvas.getContext('2d');
    if (ctx == null) return;

    // Hapus isi canvas
    (ctx as html.CanvasRenderingContext2D).clearRect(0, 0, canvas.width!, canvas.height!);

    final labels = chartData.keys.toList();
    final values = chartData.values.toList();

    // Gambar sumbu X dan Y dsb
    // #1 Hitung lebar, tinggi
    final w = canvas.width!.toDouble();
    final h = canvas.height!.toDouble();

    // #2 Hitung max value
    final maxVal = values.isEmpty ? 0 : values.reduce((a, b) => a > b ? a : b);
    final padding = 40.0;

    // Fungsi konversi value -> y
    double valueToY(int val) {
      // area chart top = padding, bottom = h - padding
      // (0) -> h - padding, (maxVal) -> padding
      final chartHeight = h - 2 * padding;
      return h - padding - (val / maxVal) * chartHeight;
    }

    // #3 Gambar axis
    final ctx2d = ctx as html.CanvasRenderingContext2D;
    ctx2d
      ..strokeStyle = 'gray'
      ..lineWidth = 1
      ..beginPath()
      // sumbu Y
      ..moveTo(padding, padding)
      ..lineTo(padding, h - padding)
      // sumbu X
      ..moveTo(padding, h - padding)
      ..lineTo(w - padding, h - padding)
      ..stroke();

    if (labels.isEmpty) return;

    // #4 Gambar line chart
    final stepX = (w - 2 * padding) / (labels.length - 1);
    ctx2d.strokeStyle = '#16A34A';
    ctx2d.beginPath();
    for (int i = 0; i < labels.length; i++) {
      final x = padding + i * stepX;
      final y = valueToY(values[i]);
      if (i == 0) {
        ctx2d.moveTo(x, y);
      } else {
        ctx2d.lineTo(x, y);
      }
    }
    ctx2d.stroke();

    // #5 Titik
    ctx2d.fillStyle = '#16A34A';
    for (int i = 0; i < labels.length; i++) {
      final x = padding + i * stepX;
      final y = valueToY(values[i]);
      ctx2d.beginPath();
      ctx2d.arc(x, y, 3, 0, 3.14 * 2);
      ctx2d.fill();
    }

    // #6 Label axis X
    ctx2d.fillStyle = 'black';
    ctx2d.textAlign = 'center';
    for (int i = 0; i < labels.length; i++) {
      final x = padding + i * stepX;
      final label = labels[i];
      ctx2d.fillText(label, x, h - padding + 15);
    }

    // #7 Label axis Y (opsional), menampilkan 0..maxVal
  }

  void onModeChange(String newMode) {
    setState(() {
      mode = newMode;
      // Reset period
      period = (newMode == 'yearly') ? '2023' : 'Januari';
    });
    fetchChartData();
  }

  void onPeriodChange(String newPeriod) {
    setState(() => period = newPeriod);
    fetchChartData();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      // Dropdown 1: yearly / monthly
      select(
        [
          option(value: 'yearly', selected: (mode == 'yearly'), [text('Per Tahun')]),
          option(value: 'monthly', selected: (mode == 'monthly'), [text('Per Bulan')]),
        ],
        onChange: (val) => onModeChange(val.first),
      ),
      // Dropdown 2: isi bergantung mode
      if (mode == 'yearly')
        select(
          [
            for (final year in ['2022', '2023', '2024', '2025'])
              option(value: year, selected: (period == year), [text(year)])
          ],
          onChange: (val) => onPeriodChange(val.first),
        )
      else
        select(
          [
            for (final m in ['Januari', 'Februari', 'Maret', 'April', 'Mei'])
              option(value: m, selected: (period == m), [text(m)])
          ],
          onChange: (val) => onPeriodChange(val.first),
        ),

      // Canvas
      DomComponent(
        tag: 'canvas',
        attributes: {
          'id': 'chart-member',
          'width': '800',
          'height': '400',
          'style': 'border:1px solid #ccc; margin-top:12px;'
        },
      ),
    ]);
  }
}
