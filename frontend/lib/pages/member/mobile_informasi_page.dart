import 'package:jaspr/jaspr.dart';
import '../../components/member/member_layout.dart';

class MobileInformasiPage extends StatelessComponent {
  const MobileInformasiPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield LayoutMember(
      pageTitle: 'Informasi',
      child: div(classes: 'mobile-informasi-page', [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/mobile-info-handler.js'},
        ),
        div(classes: 'mobile-filter-buttons', [
          button(
            classes: 'mobile-filter-button active',
            attributes: {'data-filter': 'Semua'},
            [text('Semua')],
          ),
          button(
            classes: 'mobile-filter-button',
            attributes: {'data-filter': 'Perusahaan'},
            [text('Perusahaan')],
          ),
          button(
            classes: 'mobile-filter-button',
            attributes: {'data-filter': 'Member'},
            [text('Member')],
          ),
        ]),
        ul(classes: 'mobile-informasi-list', [
          for (var info in _dummyData())
            li(
              classes: 'mobile-informasi-item',
              attributes: {'data-type': info['type'] ?? ''}, // Default empty string
              [
                div(classes: 'mobile-informasi-icon', [
                  img(src: '/images/logo.png', alt: 'Logo'),
                ]),
                div(classes: 'mobile-informasi-text', [
                  h3([text(info['title'] ?? '')]), // Default empty string
                  p([text(info['description'] ?? '')]), // Default empty string
                ]),
              ],
            ),
        ]),
      ]),
    );
  }

  List<Map<String, String>> _dummyData() {
    return [
      {
        'type': 'Perusahaan',
        'title': 'Pengumuman Libur Nasional',
        'description': 'Libur pada tanggal 1 Januari 2024.',
      },
      {
        'type': 'Member',
        'title': 'Diskon Member 2024',
        'description': 'Diskon 20% untuk semua produk.',
      },
      {
        'type': 'Perusahaan',
        'title': 'Program Reward Tahunan',
        'description': 'Dapatkan hadiah menarik dengan transaksi tertentu.',
      },
      {
        'type': 'Member',
        'title': 'Event Khusus Member',
        'description': 'Event eksklusif untuk member di bulan Februari.',
      },
      {
        'type': 'Perusahaan',
        'title': 'Kebijakan Baru',
        'description': 'Perubahan jam operasional mulai bulan depan.',
      },
    ];
  }
}
