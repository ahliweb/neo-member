import 'package:serverpod/serverpod.dart';
import '../generated/member.dart';
import '../generated/sales.dart';

class DashboardEndpoint extends Endpoint {
  Future<int> getTotalMembers(Session session) async {
    return (await Member.db.count(session));
  }

  Future<int> getValidMembers(Session session) async {
    return (await Member.db.count(
      session,
      where: (m) => m.status.equals('Valid'),
    ));
  }

  Future<int> getSalesCount(Session session) async {
    return (await Sales.db.count(session));
  }

  /// Contoh data chart, kumpulkan member baru berdasarkan mode & period
  /// mode = 'yearly' / 'monthly'
  /// period = '2023' / 'Februari' (opsional)
  Future<Map<String, int>> getMemberChartData(
    Session session, {
    required String mode,
    String? period,
  }) async {
    // Kembalikan data map: { 'Jan': 120, 'Feb': 90, ... }
    // Simpan label -> count
    final result = <String, int>{};

    // Contoh: grouping data member berdasarkan createdAt
    final allMembers = await Member.db.find(session);

    if (mode == 'yearly') {
      // misalnya group by bulan
      final labels = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      for (var label in labels) {
        result[label] = 0;
      }

      // isinya misal: period = '2025' => ambil member yang createdAt.year = 2025
      final targetYear = int.tryParse(period ?? '') ?? DateTime.now().year;

      for (final mem in allMembers) {
        final date = mem.tanggalDibuat; // 2025-01-25
        if (date.year == targetYear) {
          final monthIndex = date.month; // 1..12
          final label = labels[monthIndex - 1]; 
          result[label] = (result[label] ?? 0) + 1;
        }
      }
    } else {
      // mode monthly -> misalkan group by Tanggal (1..31)
      final labels = List.generate(31, (i) => (i + 1).toString());
      for (final lab in labels) {
        result[lab] = 0;
      }

      // period = 'Februari' misal => index=2
      final monthMap = {
        'Januari': 1,
        'Februari': 2,
        'Maret': 3,
        'April': 4,
        'Mei': 5,
        // Lanjut ...
      };
      final month = monthMap[period ?? 'Januari'] ?? DateTime.now().month;
      final year = DateTime.now().year; // Atau tentukan default year

      for (final mem in allMembers) {
        final date = mem.tanggalDibuat;
        if (date.month == month && date.year == year) {
          final day = date.day; // 1..31
          result[day.toString()] = (result[day.toString()] ?? 0) + 1;
        }
      }
    }

    return result;
  }
}
