import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class SalesMembersList extends StatelessComponent {
  final String salesName;
  final List<mem.Member> members;
  final VoidCallback onBack;

  const SalesMembersList({
    required this.salesName,
    required this.members,
    required this.onBack,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Debug untuk memastikan nilai salesName
    print('Sales Name: $salesName');

    yield div(classes: 'sales-members-list', [
      h3([text('Member dari Sales: ${salesName.isNotEmpty ? salesName : "Tidak Diketahui"}')]),

      // Tampilkan tabel atau keterangan kosong
      if (members.isEmpty)
        div(
          classes: 'no-data',
          [
            text('Tidak ada member yang terdaftar pada sales ${salesName.isNotEmpty ? salesName : "Tidak Diketahui"}.'),
          ],
        )
      else
        table(classes: 'sales-table', [
          thead([
            tr([
              th([text('Nama Member')]),
              th([text('NIK')]),
              th([text('No. WhatsApp')]),
            ]),
          ]),
          tbody([
            for (final member in members)
              tr([
                td([text(member.namaPelanggan)]),
                td([text(member.nik.toString())]),
                td([text(member.noWhatsapp)]),
              ]),
          ]),
        ]),

      // Tombol kembali selalu muncul
      button(classes: 'cancel-button', onClick: onBack, [text('KEMBALI')]),
    ]);
  }
}
