import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class FormulirDetail extends StatelessComponent {
  final mem.Member member;
  final VoidCallback onBack;

  const FormulirDetail({
    required this.member,
    required this.onBack,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'formulir-detail', [
      h2([text('Detail Member')]),

      div(classes: 'formulir-form-group', [
        label([text('Nama Pelanggan')]),
        div([text(member.namaPelanggan)]),
      ]),
      div(classes: 'formulir-form-group', [
        label([text('NIK')]),
        div([text(member.nik.toString())]),
      ]),
      div(classes: 'formulir-form-group', [
        label([text('No. Whatsapp')]),
        div([text(member.noWhatsapp)]),
      ]),
      div(classes: 'formulir-form-group', [
        label([text('Alamat KTP')]),
        div([text(member.alamatKtp)]),
      ]),
      div(classes: 'formulir-form-group', [
        label([text('Alamat Domisili')]),
        div([text(member.alamatDomisili?? '')]),
      ]),

      // Tombol Kembali
      div(classes: 'form-actions', [
        button(
          classes: 'cancel-button',
          onClick: onBack,
          [text('KEMBALI')],
        ),
      ]),
    ]);
  }
}
