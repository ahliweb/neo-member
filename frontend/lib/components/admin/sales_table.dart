import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';

class SalesTable extends StatefulComponent {
  final List<Sales> salesList;
  final String searchQuery;
  final void Function(Sales) onEdit;
  final void Function(Sales) onDelete;
  final void Function(Sales) onViewMembers;

  const SalesTable({
    required this.salesList,
    required this.searchQuery,
    required this.onEdit,
    required this.onDelete,
    required this.onViewMembers,
    super.key,
  });

  @override
  State<SalesTable> createState() => _SalesTableState();
}

class _SalesTableState extends State<SalesTable> {
  String currentSortColumn = 'namaSales'; // Default sorting column
  bool isSortAscending = true; // Default sorting direction
  int currentPage = 1;
  int rowsPerPage = 8;

  List<Sales> get paginatedAndSortedSales {
    // Filter, sort, and paginate salesList
    final filtered = component.salesList.where((sales) {
      final query = component.searchQuery.toLowerCase();
      return sales.namaSales.toLowerCase().contains(query) ||
          sales.nik.toLowerCase().contains(query) ||
          sales.noWhatsapp.toLowerCase().contains(query);
    }).toList();

    filtered.sort((a, b) {
      int compare;
      switch (currentSortColumn) {
        case 'namaSales':
          compare = a.namaSales.compareTo(b.namaSales);
          break;
        case 'nik':
          compare = a.nik.compareTo(b.nik);
          break;
        case 'noWhatsapp':
          compare = a.noWhatsapp.compareTo(b.noWhatsapp);
          break;
        case 'jumlahMember':
          compare = (a.pelanggan?.length ?? 0).compareTo(b.pelanggan?.length ?? 0);
          break;
        default:
          compare = 0;
      }
      return isSortAscending ? compare : -compare;
    });

    final start = (currentPage - 1) * rowsPerPage;
    final end = start + rowsPerPage;
    return filtered.sublist(
      start < filtered.length ? start : filtered.length,
      end < filtered.length ? end : filtered.length,
    );
  }

  void changeSortColumn(String column) {
    setState(() {
      if (currentSortColumn == column) {
        isSortAscending = !isSortAscending;
      } else {
        currentSortColumn = column;
        isSortAscending = true;
      }
    });
  }

  void changePage(int page) {
    setState(() => currentPage = page);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (component.salesList.isEmpty) {
      yield div(
        classes: 'no-data',
        [
          text(
            component.searchQuery.isEmpty
                ? 'Tidak ada data sales dalam database.'
                : 'Tidak ada sales yang sesuai dengan pencarian.',
          ),
        ],
      );
      return;
    }

    final totalPages = (component.salesList.length / rowsPerPage).ceil();

    yield table(classes: 'sales-table', [
      thead([
        tr([
          th([
            button(
              classes: 'sort-button ${currentSortColumn == 'namaSales' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
              [
                text('Nama Sales'),
                i([], classes: 'fa-solid fa-arrow-down'),
              ],
              onClick: () => changeSortColumn('namaSales'),
            ),
          ]),
          th([
            button(
              classes: 'sort-button ${currentSortColumn == 'nik' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
              [
                text('NIK'),
                i([], classes: 'fa-solid fa-arrow-down'),
              ],
              onClick: () => changeSortColumn('nik'),
            ),
          ]),
          th([
            button(
              classes: 'sort-button ${currentSortColumn == 'noWhatsapp' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
              [
                text('No. WhatsApp'),
                i([], classes: 'fa-solid fa-arrow-down'),
              ],
              onClick: () => changeSortColumn('noWhatsapp'),
            ),
          ]),
          th([
            button(
              classes: 'sort-button ${currentSortColumn == 'jumlahMember' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
              [
                text('Jumlah Member'),
                i([], classes: 'fa-solid fa-arrow-down'),
              ],
              onClick: () => changeSortColumn('jumlahMember'),
            ),
          ]),
          th([text('Aksi')]),
        ]),
      ]),
      tbody([
        for (final sales in paginatedAndSortedSales)
          tr([
            td([text(sales.namaSales)]),
            td([text(sales.nik)]),
            td([text(sales.noWhatsapp)]),
            td([text((sales.pelanggan?.length ?? 0).toString())]),
            td([
              button(
                classes: 'action-button edit',
                onClick: () => component.onEdit(sales),
                [text('✎ Edit')],
              ),
              button(
                classes: 'action-button delete',
                onClick: () => component.onDelete(sales),
                [text('🗑 Hapus')],
              ),
              button(
                classes: 'action-button view-members',
                onClick: () => component.onViewMembers(sales),
                [text('👁 Lihat')],
              ),
            ]),
          ]),
      ]),
    ]);

    // Pagination controls
    yield div(classes: 'pagination-container', [
      if (currentPage > 1)
        button(
          classes: 'pagination-button previous',
          onClick: () => changePage(currentPage - 1),
          [text('<')],
        ),
      span(classes: 'pagination-info', [text('Halaman $currentPage dari $totalPages')]),
      if (currentPage < totalPages)
        button(
          classes: 'pagination-button next',
          onClick: () => changePage(currentPage + 1),
          [text('>')],
        ),
    ]);
  }
}
