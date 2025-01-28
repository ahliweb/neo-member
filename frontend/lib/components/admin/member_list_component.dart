import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';

class MemberListComponent extends StatefulComponent {
  final List<Member> members;
  final void Function(Member member) onSelect;
  final String searchQuery; // Tambahkan ini
  final String currentFilter; // Tambahkan ini
  final void Function(String column) onSort; // Fungsi sorting dari MemberPage
  final String currentSortColumn;
  final bool isSortAscending;

  const MemberListComponent({
    required this.members,
    required this.onSelect,
    required this.searchQuery, // Tambahkan ini
    required this.currentFilter, // Tambahkan ini
    required this.onSort, // Tambahkan ini
    required this.currentSortColumn, // Tambahkan ini
    required this.isSortAscending, // Tambahkan ini
    super.key,
  });

  @override
  State<MemberListComponent> createState() => _MemberListComponentState();
}

class _MemberListComponentState extends State<MemberListComponent> {
  static const int rowsPerPage = 8;
  int currentPage = 1;

  String currentSortColumn = 'namaPelanggan'; // Kolom default untuk sorting
  bool isSortAscending = true; // Arah sorting default

  List<Member> get sortedMembers {
    var sortedList = List<Member>.from(component.members);

    sortedList.sort((a, b) {
      int compare;
      switch (currentSortColumn) {
        case 'namaPelanggan':
          compare = a.namaPelanggan.compareTo(b.namaPelanggan);
          break;
        case 'nik':
          compare = a.nik.compareTo(b.nik);
          break;
        case 'noWhatsapp':
          compare = a.noWhatsapp.compareTo(b.noWhatsapp);
          break;
        default:
          return 0;
      }
      return isSortAscending ? compare : -compare;
    });

    return sortedList;
  }

  List<Member> get paginatedMembers {
    final startIndex = (currentPage - 1) * rowsPerPage;
    final endIndex = startIndex + rowsPerPage;
    return component.members.sublist(
      startIndex,
      endIndex.clamp(0, component.members.length),
    );
  }

  int get totalPages => (component.members.length / rowsPerPage).ceil();

  void sortTable(String column) {
    setState(() {
      if (currentSortColumn == column) {
        isSortAscending = !isSortAscending; // Toggle arah sorting
      } else {
        currentSortColumn = column; // Ganti kolom sorting
        isSortAscending = true; // Reset ke ascending
      }
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (component.members.isEmpty) {
      // Keterangan jika tabel kosong
      yield div(classes: 'no-data', [
        text(component.currentFilter == 'Semua' && component.searchQuery.isEmpty
            ? 'Tidak ada data member dalam database.'
            : 'Tidak ada member yang sesuai dengan filter atau pencarian.'),
      ]);
      return;
    }

    yield div(classes: 'member-list-container', [
      table(classes: 'member-table', [
        thead([
          tr([
            th([
              button(
                classes: 'sort-button ${component.currentSortColumn == 'namaPelanggan' ? 'active ${!component.isSortAscending ? 'desc' : ''}' : ''}',
                [
                  text('MEMBER'),
                  i([], classes: 'fa-solid fa-arrow-down'),
                ],
                onClick: () => component.onSort('namaPelanggan'), // Panggil dari props
              ),
            ]),
            th([
              button(
                classes: 'sort-button ${component.currentSortColumn == 'nik' ? 'active ${!component.isSortAscending ? 'desc' : ''}' : ''}',
                [
                  text('NIK'),
                  i([], classes: 'fa-solid fa-arrow-down'),
                ],
                onClick: () => component.onSort('nik'), // Panggil dari props
              ),
            ]),
            th([
              button(
                classes: 'sort-button ${component.currentSortColumn == 'noWhatsapp' ? 'active ${!component.isSortAscending ? 'desc' : ''}' : ''}',
                [
                  text('No. WhatsApp'),
                  i([], classes: 'fa-solid fa-arrow-down'),
                ],
                onClick: () => component.onSort('noWhatsapp'), // Panggil dari props
              ),
            ]),
            th([text('STATUS')]),
            th([text('AKSI')]),
          ]),
        ]),



        tbody([
          for (final member in paginatedMembers)
            tr([
              td([text(member.namaPelanggan)]),
              td([text(member.nik.toString())]),
              td([text(member.noWhatsapp)]),
              td([
                span(
                  classes: member.status == 'Valid'
                      ? 'status-box valid'
                      : 'status-box invalid',
                  [text(member.status)],
                ),
              ]),
              td([
                button(
                  classes: member.status == 'Valid'
                      ? 'action-button edit'
                      : 'action-button verify',
                  [text(member.status == 'Valid' ? 'UBAH' : 'VERIFIKASI')],
                  onClick: () => component.onSelect(member),
                ),
              ]),
            ]),
        ]),
      ]),
      // Pagination
      div(classes: 'pagination-container', [
        if (currentPage > 1)
          button(
            classes: 'pagination-button previous',
            onClick: () => setState(() => currentPage--),
            [text('<')],
          ),
        span(classes: 'pagination-info', [
          text('Halaman $currentPage dari $totalPages'),
        ]),
        if (currentPage < totalPages)
          button(
            classes: 'pagination-button next',
            onClick: () => setState(() => currentPage++),
            [text('>')],
          ),
      ]),
    ]);
  }
}
