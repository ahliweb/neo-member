import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as client;

class InformationForm extends StatefulComponent {
  final bool isEdit;
  final client.Informasi? informasi;
  final Function(client.Informasi) onSubmit;
  final VoidCallback onCancel;

  const InformationForm({
    required this.isEdit,
    this.informasi,
    required this.onSubmit,
    required this.onCancel,
    super.key,
  });

  @override
  State createState() => _InformationFormState(
        isEdit: isEdit,
        informasi: informasi,
        onSubmit: onSubmit,
        onCancel: onCancel,
      );
}

class _InformationFormState extends State<InformationForm> {
  late String tujuan;
  late String judul;
  late String deskripsi;

  final bool isEdit;
  final client.Informasi? informasi;
  final Function(client.Informasi) onSubmit;
  final VoidCallback onCancel;

  _InformationFormState({
    required this.isEdit,
    required this.informasi,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  void initState() {
    super.initState();
    tujuan = informasi?.tujuan ?? '';
    judul = informasi?.judul ?? '';
    deskripsi = informasi?.deskripsi ?? '';
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'information-form', [
      h3([text(isEdit ? 'Edit Informasi' : 'Tambah Informasi')]),
      div(classes: 'form-group', [
      label([text('Tujuan Informasi')]),
      select(
        [
          option(
            value: 'Member',
            selected: (tujuan == 'Member'),
            [text('Member')],
          ),
          option(
            value: 'Sales',
            selected: (tujuan == 'Sales'),
            [text('Sales')],
          ),
          option(
            value: 'Perusahaan',
            selected: (tujuan == 'Perusahaan'),
            [text('Perusahaan')],
          ),
        ],
        attributes: {
          'id': 'info-tujuan',
        },
        onChange: (value) {
          setState(() {
            tujuan = value as String;
          });
        },
      ),
    ]),

      div(classes: 'form-group', [
        label([text('Judul')]),
        input(
          [],
          attributes: {
            'id': 'info-title',
            'value': judul,
          },
          onInput: (value) {
            setState(() {
              judul = value;
            });
          },
        ),
      ]),
      div(classes: 'form-group', [
        label([text('Deskripsi')]),
        textarea(
          [text(deskripsi)], // Gunakan deskripsi sebagai konten di dalam textarea
          attributes: {
            'id': 'info-content',
          },
          onInput: (value) {
            setState(() {
              deskripsi = value;
            });
          },
        ),

      ]),
      div(classes: 'form-actions', [
        button(
          id: 'submit-info-button',
          classes: 'submit-button',
          [text('Kirim')],
          onClick: () {
            onSubmit(
              client.Informasi(
                id: informasi?.id,
                tujuan: tujuan,
                judul: judul,
                deskripsi: deskripsi,
                tanggalDibuat: informasi?.tanggalDibuat ?? DateTime.now(),
              ),
            );
          },
        ),
        button(
          id: 'cancel-info-button',
          classes: 'cancel-button',
          [text('Batal')],
          onClick: onCancel,
        ),
      ]),
    ]);
  }
}
