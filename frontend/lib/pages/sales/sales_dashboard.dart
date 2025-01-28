import 'package:jaspr/jaspr.dart';
import '../../components/sales/sales_layout.dart';

class SalesDashboardPage extends StatelessComponent {
  const SalesDashboardPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield LayoutSales(
      pageTitle: 'Formulir Reward Member',
      child: div(classes: 'sales-form-page', [
        DomComponent(
          tag: 'link',
          attributes: {
            'rel': 'stylesheet',
            'href': '/styles/mobile-sales.css',
          },
        ),
        form([ // Form Wrapper
          // Nama Pelanggan
          div(classes: 'form-group', [
            input(
              [],
              classes: 'form-control floating-input',
              type: InputType.text,
              attributes: {'placeholder': ' ', 'id': 'nama-pelanggan'},
            ),
            label(
              [text('Nama Pelanggan')],
              attributes: {'for': 'nama-pelanggan'},
              classes: 'floating-label',
            ),
          ]),

          // NIK
          div(classes: 'form-group', [
            input(
              [],
              classes: 'form-control floating-input',
              type: InputType.text,
              attributes: {'placeholder': ' ', 'id': 'nik'},
            ),
            label(
              [text('NIK')],
              attributes: {'for': 'nik'},
              classes: 'floating-label',
            ),
          ]),

          // No. Whatsapp
          div(classes: 'form-group', [
            input(
              [],
              classes: 'form-control floating-input',
              type: InputType.text,
              attributes: {'placeholder': ' ', 'id': 'no-wa'},
            ),
            label(
              [text('No. Whatsapp')],
              attributes: {'for': 'no-wa'},
              classes: 'floating-label',
            ),
          ]),

          // Alamat KTP
          div(classes: 'form-group', [
            input(
              [],
              classes: 'form-control floating-input',
              type: InputType.text,
              attributes: {'placeholder': ' ', 'id': 'alamat-ktp'},
            ),
            label(
              [text('Alamat KTP')],
              attributes: {'for': 'alamat-ktp'},
              classes: 'floating-label',
            ),
          ]),

          // Kelurahan & Kecamatan (KTP)
          div(classes: 'form-row', [
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Kelurahan')]),
                option( attributes: {'value': 'kelurahan-a'}, [text('Kelurahan A')]),
                option( attributes: {'value': 'kelurahan-b'}, [text('Kelurahan B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'kelurahan-ktp'}),
              label(
                [text('Kelurahan')],
                attributes: {'for': 'kelurahan-ktp'},
                classes: 'floating-label',
              ),
            ]),
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Kecamatan')]),
                option( attributes: {'value': 'kecamatan-a'}, [text('Kecamatan A')]),
                option( attributes: {'value': 'Kecamatan-b'}, [text('Kecamatan B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'kecamatan-ktp'}),
              label(
                [text('Kecamatan')],
                attributes: {'for': 'kecamatan-ktp'},
                classes: 'floating-label',
              ),
            ]),
          ]),

          // Kabupaten & Provinsi (KTP)
          div(classes: 'form-row', [
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Kabupaten')]),
                option( attributes: {'value': 'kabupaten-a'}, [text('Kabupaten A')]),
                option( attributes: {'value': 'kabupaten-b'}, [text('Kabupaten B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'kabupaten-ktp'}),
              label(
                [text('Kabupaten')],
                attributes: {'for': 'kabupaten-ktp'},
                classes: 'floating-label',
              ),
            ]),
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Provinsi')]),
                option( attributes: {'value': 'provinsi-a'}, [text('Provinsi A')]),
                option( attributes: {'value': 'provinsi-b'}, [text('Provinsi B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'provinsi-ktp'}),
              label(
                [text('Provinsi')],
                attributes: {'for': 'provinsi-ktp'},
                classes: 'floating-label',
              ),
            ]),
          ]),

          // Alamat Domisili
          div(classes: 'form-group', [
            input(
              [],
              classes: 'form-control floating-input',
              type: InputType.text,
              attributes: {'placeholder': ' ', 'id': 'alamat-domisili'},
            ),
            label(
              [text('Alamat Domisili')],
              attributes: {'for': 'alamat-domisili'},
              classes: 'floating-label',
            ),
          ]),

          // Kelurahan & Kecamatan (Domisili)
          div(classes: 'form-row', [
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Kelurahan')]),
                option( attributes: {'value': 'kelurahan-a'}, [text('Kelurahan A')]),
                option( attributes: {'value': 'kelurahan-b'}, [text('Kelurahan B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'kelurahan-domisili'}),
              label(
                [text('Kelurahan')],
                attributes: {'for': 'kelurahan-domisili'},
                classes: 'floating-label',
              ),
            ]),
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Kecamatan')]),
                option( attributes: {'value': 'kecamatan-a'}, [text('Kecamatan A')]),
                option( attributes: {'value': 'Kecamatan-b'}, [text('Kecamatan B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'kecamatan-domisili'}),
              label(
                [text('Kecamatan')],
                attributes: {'for': 'kecamatan-domisili'},
                classes: 'floating-label',
              ),
            ]),
          ]),

          // Kabupaten & Provinsi (Domisili)
          div(classes: 'form-row', [
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Kabupaten')]),
                option( attributes: {'value': 'kabupaten-a'}, [text('Kabupaten A')]),
                option( attributes: {'value': 'kabupaten-b'}, [text('Kabupaten B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'kabupaten-domisili'}),
              label(
                [text('Kabupaten')],
                attributes: {'for': 'kabupaten-domisili'},
                classes: 'floating-label',
              ),
            ]),
            div(classes: 'form-group', [
              select([
                option( attributes: {'value': ''}, [text('Pilih Provinsi')]),
                option( attributes: {'value': 'provinsi-a'}, [text('Provinsi A')]),
                option( attributes: {'value': 'provinsi-b'}, [text('Provinsi B')]),
              ], classes: 'form-control floating-input', attributes: {'id': 'provinsi-domisili'}),
              label(
                [text('Provinsi')],
                attributes: {'for': 'provinsi-domisili'},
                classes: 'floating-label',
              ),
            ]),
          ]),

          // Akses Lokasi
          div(classes: 'form-group form-inline', [
            label([text('Beri Akses Lokasi')]),
            input(
              [],
              type: InputType.checkbox,
              classes: 'toggle-switch',
            ),
          ]),

          // Submit Button
          button(classes: 'submit-button', [text('Kirim')]),
        ]),
      ]),
    );
  }
}
