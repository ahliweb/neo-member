import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class MemberWithSalesName {
  final mem.Member member;
  final String salesName;

  MemberWithSalesName({
    required this.member,
    required this.salesName,
  });
}

class FormulirList extends StatefulComponent {
  final List<MemberWithSalesName> members;
  final String currentFilter; // 'Semua', 'Valid', 'Belum Valid'
  final String searchQuery;
  final void Function(String) onFilterChange;
  final void Function(String) onSearchChange;
  final VoidCallback onAddFormulir;
  final void Function(mem.Member) onViewDetail;
  final Future<String?> Function(int salesId) fetchSalesName;

  const FormulirList({
    required this.members,
    required this.currentFilter,
    required this.searchQuery,
    required this.onFilterChange,
    required this.onSearchChange,
    required this.onAddFormulir,
    required this.onViewDetail,
    required this.fetchSalesName,
    super.key,
  });

  @override
  State<FormulirList> createState() => _FormulirListState();
}

class _FormulirListState extends State<FormulirList> {
  int currentPage = 1;
  final int rowsPerPage = 8;
  String currentSortColumn = 'namaPelanggan';
  bool isSortAscending = true;

  List<MemberWithSalesName> get filteredList {
    final filter = component.currentFilter.toLowerCase();
    return component.members.where((mwsn) {
      final member = mwsn.member;

      // Filter berdasarkan status
      final isValid = member.status.toLowerCase() == 'valid';
      if (filter == 'valid' && !isValid) return false;
      if (filter == 'belum valid' && isValid) return false;

      // Filter berdasarkan search query
      final query = component.searchQuery.toLowerCase();
      final matchName = member.namaPelanggan.toLowerCase().contains(query);
      final matchNik = member.nik.toString().contains(query);
      final matchWhatsapp = member.noWhatsapp.toLowerCase().contains(query);
      return matchName || matchNik || matchWhatsapp;
    }).toList();
  }

  List<MemberWithSalesName> get sortedList {
    final list = filteredList;
    list.sort((a, b) {
      int compare;
      switch (currentSortColumn) {
        case 'namaPelanggan':
          compare = a.member.namaPelanggan.compareTo(b.member.namaPelanggan);
          break;
        case 'tanggalDibuat':
          compare = a.member.tanggalDibuat.compareTo(b.member.tanggalDibuat);
          break;
        case 'salesName':
          compare = a.salesName.compareTo(b.salesName);
          break;
        case 'status':
          compare = a.member.status.compareTo(b.member.status);
          break;
        default:
          compare = 0;
      }
      return isSortAscending ? compare : -compare;
    });
    return list;
  }

  List<MemberWithSalesName> get paginatedList {
    final start = (currentPage - 1) * rowsPerPage;
    final end = start + rowsPerPage;
    final data = sortedList;
    return data.sublist(
      start < data.length ? start : data.length,
      end < data.length ? end : data.length,
    );
  }

  int get totalPages => (filteredList.length / rowsPerPage).ceil();

  void goToNextPage() {
    if (currentPage < totalPages) {
      setState(() => currentPage++);
    }
  }

  void goToPrevPage() {
    if (currentPage > 1) {
      setState(() => currentPage--);
    }
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

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'formulir-list', [
      h1([text('Formulir')]),

      // Filter Buttons
      div(classes: 'formulir-filter-buttons', [
        button(
          classes: 'formulir-filter-button ${component.currentFilter == "Semua" ? "active" : ""}',
          [text('Semua')],
          onClick: () => component.onFilterChange('Semua'),
        ),
        button(
          classes: 'formulir-filter-button ${component.currentFilter == "Valid" ? "active" : ""}',
          [text('Valid')],
          onClick: () => component.onFilterChange('Valid'),
        ),
        button(
          classes: 'formulir-filter-button ${component.currentFilter == "Belum Valid" ? "active" : ""}',
          [text('Belum Valid')],
          onClick: () => component.onFilterChange('Belum Valid'),
        ),
      ]),

      // Tabel
      table(classes: 'formulir-table', [
        thead([
          tr([
            th([
              button(
                classes: 'sort-button ${currentSortColumn == "namaPelanggan" ? "active ${!isSortAscending ? "desc" : ""}" : ""}',
                onClick: () => changeSortColumn('namaPelanggan'),
                [text('Member'),
                i([], classes: 'fa-solid fa-arrow-down'),],
              ),
            ]),
            th([
              button(
                classes: 'sort-button ${currentSortColumn == "tanggalDibuat" ? "active ${!isSortAscending ? "desc" : ""}" : ""}',
                onClick: () => changeSortColumn('tanggalDibuat'),
                [text('Tanggal'),
                i([], classes: 'fa-solid fa-arrow-down'),],
              ),
            ]),
            th([
              button(
                classes: 'sort-button ${currentSortColumn == "salesName" ? "active ${!isSortAscending ? "desc" : ""}" : ""}',
                onClick: () => changeSortColumn('salesName'),
                [text('Sales'),
                i([], classes: 'fa-solid fa-arrow-down'),],
              ),
            ]),
            th([
              button(
                classes: 'sort-button ${currentSortColumn == "status" ? "active ${!isSortAscending ? "desc" : ""}" : ""}',
                onClick: () => changeSortColumn('status'),
                [text('Status')],
              ),
            ]),
            th([text('Aksi')]),
          ])
        ]),
        tbody([
          for (final item in paginatedList)
            tr([
              td([text(item.member.namaPelanggan)]),
              td([text(item.member.tanggalDibuat.toIso8601String())]),
              td([text(item.salesName)]),
              td([
                span(
                  classes: 'tag ${item.member.status.toLowerCase() == "valid" ? "valid" : "belum-valid"}',
                  [text(item.member.status)],
                ),
              ]),
              td([
                button(
                  classes: 'action-button view-detail',
                  onClick: () => component.onViewDetail(item.member),
                  [text('Lihat Detail')],
                ),
              ]),
            ]),
        ]),
      ]),

      // Pagination
      div(classes: 'pagination', [
        button(
          classes: 'pagination-button',
          onClick: goToPrevPage,
          [text('<')],
        ),
        span([text('Halaman $currentPage dari $totalPages')]),
        button(
          classes: 'pagination-button',
          onClick: goToNextPage,
          [text('>')],
        ),
      ]),

      // Tombol tambah
      div(classes: 'formulir-add-button-container', [
        button(
          classes: 'formulir-add-button',
          onClick: component.onAddFormulir,
          [text('+ Tambah Formulir')],
        ),
      ]),
    ]);
  }
}
