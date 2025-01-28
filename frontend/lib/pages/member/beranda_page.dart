import 'package:jaspr/jaspr.dart';
import '../../components/member/member_layout.dart';

class BerandaPage extends StatelessComponent {
  const BerandaPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield LayoutMember(
      pageTitle: '',
      child: DomComponent(
        tag: 'div',
        classes: 'beranda-page',
        children: [
          // Header Custom
          DomComponent(tag: 'div', classes: 'custom-header', children: [
            p(classes: 'greeting-text', [text('Selamat Datang,')]),
            h1(classes: 'customer-name', [text('Bapak Agus')]),
          ]),
          // Kartu Pelanggan
          DomComponent(tag: 'div', classes: 'card-container', children: [
            DomComponent(
              tag: 'img',
              attributes: {
                'src': '/images/member-card.png',
                'alt': 'Kartu Pelanggan Noesantara'
              },
              classes: 'member-card-image',
            ),
          ]),
          // Deskripsi Aplikasi
          DomComponent(tag: 'section', classes: 'app-description', children: [
            h2(classes: 'section-title', [text('Aplikasi Member Noesantara!')]),
            p(classes: 'description-text', [
              text(
                  'Aplikasi ini dirancang khusus untuk membantu Anda, para petani, meningkatkan hasil panen dan memaksimalkan keuntungan.')
            ]),
            p(classes: 'description-text', [
              text(
                  'Dengan bergabung di aplikasi kami, Anda akan mendapatkan:')
            ]),
            ul(classes: 'benefit-list', [
              li([text('✅ Akses ke Promo Eksklusif : Diskon spesial untuk pembelian pupuk dan produk pertanian.')]),
              li([text('✅ Informasi Program Terbaru : Berbagai pelatihan, seminar, dan program pengembangan petani langsung dari kami.')]),
              li([text('✅ Rekomendasi Tepat Sasaran : Solusi pupuk dan teknik pertanian yang sesuai dengan kebutuhan Anda berdasarkan data lokasi dan jenis tanaman.')]),
            ]),
          ]),
        ],
      ),
    );
  }
}
