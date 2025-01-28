import 'package:jaspr/jaspr.dart';

class DatabaseList extends StatelessComponent {
  const DatabaseList({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield table(classes: 'database-table', [
      thead([
        tr([
          th([text('MEMBER')]),
          th([text('NIK')]),
          th([text('No. WhatsApp')]),
          th([text('KTP')]),
          th([text('BUKTI PEMBAYARAN')]),
        ]),
      ]),
      tbody([
        for (var i = 0; i < 6; i++)
          tr([
            td([text(i % 2 == 0 ? 'Agus' : 'Budi')]),
            td([text('620101090205000${i + 1}')]),
            td([text('082146591205')]),
            td([
              img(
                src: '/images/ktp.png',
                alt: 'KTP',
                classes: 'ktp-image',
              ),
            ]),
            td([
              button(
                classes: 'lihat-bukti-button',
                [text('LIHAT BUKTI')],
              ),
            ]),
          ]),
      ]),
    ]);
  }
}
