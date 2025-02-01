import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class FormulirDetail extends StatefulComponent {
  final mem.Member member;
  final VoidCallback onBack;
  final Future<mem.Sales?> Function(int salesId) fetchSales; // Fungsi untuk mengambil data sales

  const FormulirDetail({
    required this.member,
    required this.onBack,
    required this.fetchSales,
    super.key,
  });

  @override
  State<FormulirDetail> createState() => _FormulirDetailState();
}

class _FormulirDetailState extends State<FormulirDetail> {
  String salesName = 'Belum terdaftar pada Sales';
  // bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadSalesName();
  }

  Future<void> loadSalesName() async {
      final sales = await component.fetchSales(component.member.salesPelangganSalesId!);
      setState(() {
        salesName = sales?.namaSales ?? 'Belum terdaftar pada Sales';
        // isLoading = false;
      });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'verification-container', [
      h2([text('Detail Member')]),

      // if (isLoading)
      //   div(classes: 'loading-overlay', [
      //     div([],classes: 'loading-spinner'),
      //     div(classes: 'loading-text', [text('Memuat data...')]),
      //   ])

        div(classes: 'verification-form', [
          // Nama Pelanggan
          div(classes: 'form-field', [
            label([text('Nama Pelanggan')]),
            div([text(component.member.namaPelanggan)]),
          ]),

          // NIK
          div(classes: 'form-field', [
            label([text('NIK')]),
            div([text(component.member.nik.toString())]),
          ]),

          // No Whatsapp
          div(classes: 'form-field', [
            label([text('No. Whatsapp')]),
            div([text(component.member.noWhatsapp)]),
          ]),

          // Alamat KTP
          div(classes: 'form-field', [
            label([text('Alamat KTP')]),
            div([text(component.member.alamatKtp)]),
          ]),

          // Provinsi KTP
          div(classes: 'form-field', [
            label([text('Provinsi')]),
            div([text(component.member.provinsi)]),
          ]),

          // Kabupaten KTP
          div(classes: 'form-field', [
            label([text('Kabupaten/Kota')]),
            div([text(component.member.kabupaten)]),
          ]),

          // Kecamatan KTP
          div(classes: 'form-field', [
            label([text('Kecamatan')]),
            div([text(component.member.kecamatan)]),
          ]),

          // Kelurahan KTP
          div(classes: 'form-field', [
            label([text('Kelurahan')]),
            div([text(component.member.kelurahan)]),
          ]),

          // Alamat Domisili
          div(classes: 'form-field', [
            label([text('Alamat Domisili')]),
            div([text(component.member.alamatDomisili ?? '-')]),
          ]),

          // Provinsi Domisili
          div(classes: 'form-field', [
            label([text('Provinsi Domisili')]),
            div([text(component.member.provinsiDomisili ?? '-')]),
          ]),

          // Kabupaten Domisili
          div(classes: 'form-field', [
            label([text('Kabupaten/Kota Domisili')]),
            div([text(component.member.kabupatenDomisili ?? '-')]),
          ]),

          // Kecamatan Domisili
          div(classes: 'form-field', [
            label([text('Kecamatan Domisili')]),
            div([text(component.member.kecamatanDomisili ?? '-')]),
          ]),

          // Kelurahan Domisili
          div(classes: 'form-field', [
            label([text('Kelurahan Domisili')]),
            div([text(component.member.kelurahanDomisili ?? '-')]),
          ]),

          // Sales
          div(classes: 'form-field', [
            label([text('Sales')]),
            div([text(salesName)]),
          ]),

          // Tombol Kembali
          div(classes: 'form-actions', [
            button(
              classes: 'cancel-button',
              onClick: component.onBack,
              [text('KEMBALI')],
            ),
          ]),
        ]),
    ]);
  }
}
