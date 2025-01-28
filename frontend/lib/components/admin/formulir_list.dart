import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class FormulirList extends StatefulComponent {
  final List<mem.Member> members;
  final String currentFilter; // 'Semua', 'Valid', 'Belum Valid'
  final String searchQuery;
  final void Function(String) onFilterChange;
  final void Function(String) onSearchChange;
  final VoidCallback onAddFormulir;
  final void Function(mem.Member) onViewDetail;

  const FormulirList({
    required this.members,
    required this.currentFilter,
    required this.searchQuery,
    required this.onFilterChange,
    required this.onSearchChange,
    required this.onAddFormulir,
    required this.onViewDetail,
    super.key,
  });

  @override
  State<FormulirList> createState() => _FormulirListState();
}

class _FormulirListState extends State<FormulirList> {
  int currentPage = 1;
  final int rowsPerPage = 8;

  List<mem.Member> get filteredList {
    final filter = component.currentFilter.toLowerCase();
    return component.members.where((m) {
      // filter valid/belum valid
      final isValid = m.status.toLowerCase() == 'valid';
      if (filter == 'valid' && !isValid) return false;
      if (filter == 'belum valid' && isValid) return false;

      // search
      final query = component.searchQuery.toLowerCase();
      final matchName = m.namaPelanggan.toLowerCase().contains(query);
      final matchNik = m.nik.toString().contains(query);
      final matchWhatsapp = m.noWhatsapp.toLowerCase().contains(query);
      return matchName || matchNik || matchWhatsapp;
    }).toList();
  }

  List<mem.Member> get paginatedList {
    final start = (currentPage - 1) * rowsPerPage;
    final end = start + rowsPerPage;
    final data = filteredList;
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
            th([text('Member')]),
            th([text('Tanggal')]),
            th([text('Sales')]),
            th([text('Status')]),
            th([text('Aksi')]),
          ])
        ]),
        tbody([
          for (final item in paginatedList)
            tr([
              td([text(item.namaPelanggan)]),
              td([text(item.tanggalDibuat.toIso8601String())]),
              td([text(item.salesName ?? '-')]), // misal menambahkan field "salesName" di model
              td([
                span(
                  classes: 'tag ${item.status.toLowerCase() == 'valid' ? 'valid' : 'belum-valid'}',
                  [text(item.status)],
                ),
              ]),
              td([
                button(
                  classes: 'action-button view',
                  onClick: () => component.onViewDetail(item),
                  [text('Lihat Detail')],
                ),
              ]),
            ]),
        ]),
      ]),

      // Pagination
      div(classes: 'pagination', [
        button(
          [text('<')],
          onClick: goToPrevPage,
        ),
        button(
          [text('>')],
          onClick: goToNextPage,
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
