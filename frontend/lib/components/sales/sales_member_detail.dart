import 'package:jaspr/jaspr.dart';

class SalesMemberDetailComponent extends StatelessComponent {
  const SalesMemberDetailComponent({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'sales-member-detail-page', [
      // Header with back button
      div(classes: 'header', [
        button(
          classes: 'back-button',
          attributes: {'id': 'back-button'},
          [text('←')], // Arrow icon
        ),
        h1([text('Formulir')]),
      ]),

      // Member Info Summary
      div(classes: 'member-summary', [
        div(classes: 'member-icon valid', [
          img(src: '/images/person.png', alt: 'Profile Picture'),
        ]),
        div(classes: 'member-info', [
          h2([text('Ibu Yuniarti')]),
          p([text('6201010502710006')]),
        ]),
        div(classes: 'status-icon', [
          img(src: '/images/check.png', alt: 'Status Icon'),
        ]),
      ]),

      // Form Section
      div(classes: 'form-section', [
        _formField('Nama Pelanggan', 'Agus Sutiko'),
        _formField('NIK', '620101012000122'),
        _formField('No. WhatsApp', '0822518162910'),
        _formField('Alamat KTP', 'Jl. Gadai No. 9'),
        _formField('Kelurahan', 'Gadai Hulu'),
        _formField('Kecamatan', 'Gadai'),
        _formField('Kabupaten', 'Kotawaringin Barat'),
        _formField('Provinsi', 'Kalimantan Tengah'),
        _formField('Alamat Domisili', 'Jl. Gadai No. 9'),
      ]),
    ]);
  }

  Component _formField(String fieldLabel, String value) {
  return div(classes: 'form-group', [
    label([text(fieldLabel)], classes: 'form-label'),
    div(classes: 'form-value', [text(value)]),
  ]);
}

}
