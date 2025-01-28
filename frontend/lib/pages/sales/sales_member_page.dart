import 'package:jaspr/jaspr.dart';
import '../../components/sales/sales_layout.dart';
import '../../components/sales/sales_member_detail.dart';

class SalesMemberPage extends StatelessComponent {
  const SalesMemberPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield LayoutSales(
      pageTitle: 'Member Sales',
      child: div([
        DomComponent(
          tag: 'link',
          attributes: {
            'rel': 'stylesheet',
            'href': '/styles/mobile-sales-member.css',
          },
        ),
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/mobile-sales-member-handler.js'},
        ),
        div(classes: 'sales-member-page', [
          // Summary Section
          div(classes: 'summary-box', [
            div(classes: 'summary-item', [
              h3([text('100')]),
              p([text('Jumlah')]),
            ]),
            div(classes: 'summary-item', [
              h3([text('60')]),
              p([text('Valid')]),
            ]),
            div(classes: 'summary-item', [
              h3([text('40')]),
              p([text('Belum Valid')]),
            ]),
          ]),

          // Filter Buttons
          div(classes: 'filter-buttons', [
            button(
              classes: 'filter-button active',
              attributes: {'data-filter': 'Semua'},
              [text('Semua')],
            ),
            button(
              classes: 'filter-button',
              attributes: {'data-filter': 'Valid'},
              [text('Valid')],
            ),
            button(
              classes: 'filter-button',
              attributes: {'data-filter': 'Belum Valid'},
              [text('Belum Valid')],
            ),
          ]),

          // Member List
          ul(classes: 'member-list', [
            for (var member in _dummyMembers())
              li(
                classes: 'member-item',
                attributes: {
                  'data-name': member['name']!,
                  'data-nik': member['nik']!,
                  'data-whatsapp': member['whatsapp']!,
                  'data-status': member['status']!,
                },
                [
                  div(
                    classes: 'member-icon ${member['status'] == 'Valid' ? 'valid' : 'invalid'}',
                    [
                      img(src: '/images/person.png', alt: 'Member Icon'),
                    ],
                  ),
                  div(classes: 'member-info', [
                    h3([text(member['name']!)]),
                    p([text(member['nik']!)]),
                  ]),
                  button(
                    classes: 'member-action',
                    attributes: {'data-action': 'view-details'},
                    [
                      img(
                        src: member['status'] == 'Valid' ? '/images/check.png' : '/images/pending.png',
                        alt: member['status'] == 'Valid' ? 'Valid' : 'Pending',
                      ),
                    ],
                  ),
                ],
              ),
          ]),
        ]),
        SalesMemberDetailComponent(), // Include the detail page but hide it initially
      ]),
    );
  }

  List<Map<String, String>> _dummyMembers() {
    return [
      {'name': 'Bu Tuti Wulandari', 'nik': '6201010502710001', 'whatsapp': '081234567890', 'status': 'Valid'},
      {'name': 'Pak Agus Santoso', 'nik': '6201010502710002', 'whatsapp': '081987654321', 'status': 'Belum Valid'},
      {'name': 'Ibu Sari Wahyuni', 'nik': '6201010502710003', 'whatsapp': '081112223344', 'status': 'Valid'},
      {'name': 'Pak Budi Harsono', 'nik': '6201010502710004', 'whatsapp': '081998877665', 'status': 'Belum Valid'},
    ];
  }
}
