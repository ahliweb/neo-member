import 'package:frontend/components/admin/information_delete_popup.dart';
import 'package:frontend/components/admin/information_form.dart';
import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';

@client
class InformationList extends StatefulComponent {
  const InformationList({super.key});

  @override
  State createState() => _InformationListState();
}

class _InformationListState extends State<InformationList> {
  List<Informasi> informasiList = [];
  List<Informasi> filteredList = [];
  bool isLoading = true;
  String currentFilter = 'Semua';
  int currentPage = 1;
  final int rowsPerPage = 8;

  final client = Client('http://localhost:8080/');

  Informasi? selectedInformasi;
  bool isAddMode = false;
  bool isEditMode = false;
  int? deleteId;
  
  String? notificationMessage;
  bool isNotificationSuccess = true; // atau false, tergantung kasus

  String currentSortColumn = 'id'; // Kolom default untuk sorting
  bool isSortAscending = true;    // Arah sorting default


  @override
  void initState() {
    super.initState();
    fetchInformasi();
  }

  Future<void> fetchInformasi() async {
    try {
      final data = await client.informasi.getAllInformasi();
      setState(() {
        informasiList = data;
        filteredList = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching informasi: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveInformasi(Informasi info) async {
  try {
    if (isEditMode) {
      await client.informasi.updateInformasi(info);
    } else {
      await client.informasi.addInformasi(info);
    }
    fetchInformasi();
    setState(() {
      selectedInformasi = null;
      isEditMode = false;
      isAddMode = false;
    });
    // Tampilkan notif sukses
    showNotification('Informasi berhasil disimpan', true);
  } catch (e) {
    print('Error saving informasi: $e');
    showNotification('Gagal menyimpan informasi: $e', false);
  }
}



  void applyFilter(String filter) {
    setState(() {
      currentFilter = filter;
      if (filter == 'Semua') {
        filteredList = informasiList;
      } else {
        filteredList = informasiList.where((info) => info.tujuan == filter).toList();
      }
      currentPage = 1;
    });
  }

  void showNotification(String message, bool isSuccess) {
    setState(() {
      notificationMessage = message;
      isNotificationSuccess = isSuccess;
    });
    
    // Misal: Hilangkan notifikasi setelah beberapa detik (opsional)
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        notificationMessage = null;
      });
    });
  }


  List<Informasi> get paginatedList {
    final startIndex = (currentPage - 1) * rowsPerPage;
    final endIndex = startIndex + rowsPerPage;
    return filteredList.sublist(
      startIndex,
      endIndex > filteredList.length ? filteredList.length : endIndex,
    );
  }

  void sortTable(String column) {
    setState(() {
      if (currentSortColumn == column) {
        // Jika kolom yang sama di-sort, balik arah sorting
        isSortAscending = !isSortAscending;
      } else {
        // Jika kolom baru, set sorting ke ascending
        currentSortColumn = column;
        isSortAscending = true;
      }

      // Lakukan sorting berdasarkan kolom dan arah
      filteredList.sort((a, b) {
        int compare;
        switch (column) {
          case 'id':
            compare = a.id!.compareTo(b.id!);
            break;
          case 'tujuan':
            compare = a.tujuan.compareTo(b.tujuan);
            break;
          case 'tanggal':
            compare = a.tanggalDibuat.compareTo(b.tanggalDibuat);
            break;
          case 'judul':
            compare = a.judul.compareTo(b.judul);
            break;
          default:
            return 0;
        }
        return isSortAscending ? compare : -compare;
      });
    });
  }


  void addInformasi() {
    setState(() {
      isAddMode = true;
      isEditMode = false;
      selectedInformasi = null;
    });
  }


  void editInformasi(int id) {
    setState(() {
      isAddMode = false;
      isEditMode = true;
      selectedInformasi = informasiList.firstWhere((info) => info.id == id);
    });
  }


  void deleteInformasiPrompt(int id) {
    print('Clicked delete with id: $id');
    setState(() {
      deleteId = id;
    });
  }

  Future<void> deleteInformasi() async {
  if (deleteId == null) return;
  try {
    await client.informasi.deleteInformasi(id: deleteId!);
    informasiList.removeWhere((info) => info.id == deleteId);
    filteredList = informasiList;
    setState(() {
      deleteId = null;
    });
    showNotification('Informasi berhasil dihapus', true);
  } catch (e) {
    print('Error deleting informasi: $e');
    showNotification('Gagal menghapus informasi: $e', false);
  }
}

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Jika ada notifikasi, tampilkan
    if (notificationMessage != null) {
      yield div(
        classes: isNotificationSuccess ? 'notif success' : 'notif error',
        [ text(notificationMessage!) ],
      );
    }
    if (!isAddMode && !isEditMode) {
      yield div(classes: 'information-list', [
        div(classes: 'filter-buttons', [
          button(
            id: 'filter-all',
            classes: 'filter-button ${currentFilter == 'Semua' ? 'active' : ''}',
            [text('Semua')],
            onClick: () => applyFilter('Semua'),
          ),
          button(
            id: 'filter-company',
            classes: 'filter-button ${currentFilter == 'Perusahaan' ? 'active' : ''}',
            [text('Perusahaan')],
            onClick: () => applyFilter('Perusahaan'),
          ),
          button(
            id: 'filter-sales',
            classes: 'filter-button ${currentFilter == 'Sales' ? 'active' : ''}',
            [text('Sales')],
            onClick: () => applyFilter('Sales'),
          ),
          button(
            id: 'filter-member',
            classes: 'filter-button ${currentFilter == 'Member' ? 'active' : ''}',
            [text('Member')],
            onClick: () => applyFilter('Member'),
          ),
        ]),
        table(classes: 'information-table', [
          thead([
            tr([
              th([
                button(
                  classes: 'sort-button ${currentSortColumn == 'id' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
                  [
                    text('ID'),
                    i([],classes: 'fa-solid fa-arrow-down'),
                  ],
                  onClick: () => sortTable('id'),
                ),
              ]),
              th([
                button(
                  classes: 'sort-button ${currentSortColumn == 'tujuan' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
                  [
                    text('Tujuan'),
                    i([],classes: 'fa-solid fa-arrow-down'),
                  ],
                  onClick: () => sortTable('tujuan'),
                ),
              ]),
              th([
                button(
                  classes: 'sort-button ${currentSortColumn == 'tanggal' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
                  [
                    text('Tanggal'),
                    i([],classes: 'fa-solid fa-arrow-down'),
                  ],
                  onClick: () => sortTable('tanggal'),
                ),
              ]),
              th([
                button(
                  classes: 'sort-button ${currentSortColumn == 'judul' ? 'active ${!isSortAscending ? 'desc' : ''}' : ''}',
                  [
                    text('Judul'),
                    i([],classes: 'fa-solid fa-arrow-down'),
                  ],
                  onClick: () => sortTable('judul'),
                ),
              ]),
              th([text('Aksi')]),
            ]),
          ]),


          tbody([
            for (var item in paginatedList)
              tr([
                td([text(item.id.toString())]),
                td([text(item.tujuan)]),
                td([text(item.tanggalDibuat.toIso8601String())]),
                td([text(item.judul)]),
                td([
                  button(
                    id: 'edit-info-button-${item.id}',
                    classes: 'edit-button',
                    [text('✎')],
                    onClick: () => editInformasi(item.id!),
                  ),
                  button(
                    id: 'delete-info-button-${item.id}',
                    classes: 'delete-button',
                    [text('🗑')],
                    onClick: () => deleteInformasiPrompt(item.id!),
                  ),
                ]),
              ]),
          ]),
        ]),
        div(classes: 'pagination', [
          button(
            id: 'prev-page',
            classes: 'pagination-button',
            [text('<')],
            onClick: () {
              if (currentPage > 1) {
                setState(() {
                  currentPage--;
                });
              }
            },
          ),
          span(classes: 'pagination-info', [
            text('Halaman $currentPage dari ${(filteredList.length / rowsPerPage).ceil()}'),
          ]),
          button(
            id: 'next-page',
            classes: 'pagination-button',
            [text('>')],
            onClick: () {
              if (currentPage < (filteredList.length / rowsPerPage).ceil()) {
                setState(() {
                  currentPage++;
                });
              }
            },
          ),
        ]),
        button(
          id: 'add-info-button',
          classes: 'add-button',
          [text('+ Tambah Informasi')],
          onClick: addInformasi,
        ),
        
      ]);

    }
    
    // BAGIAN FORM: hanya muncul kalau SEDANG add/edit mode
    if (isAddMode || isEditMode) {
      yield div(classes: 'information-form-container', [
        InformationForm(
          isEdit: isEditMode,
          informasi: isEditMode ? selectedInformasi : null,
          onSubmit: (info) => saveInformasi(info),
          onCancel: () {
            setState(() {
              isAddMode = false;
              isEditMode = false;
              selectedInformasi = null;
            });
          },
        )
      ]);
    }

       
    // BAGIAN DELETE POPUP: muncul kalau deleteId != null
    if (deleteId != null) {
      yield InformationDeletePopup(
        deleteId: deleteId!,
        onDelete: deleteInformasi,
        onCancel: () => setState(() => deleteId = null),
      );
    }
  }
}
