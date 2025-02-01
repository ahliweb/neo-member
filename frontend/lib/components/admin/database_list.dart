import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;
import 'ktp_popup.dart';
import 'payment_popup.dart';
import 'database_bukti_list.dart';
import 'search_box.dart';

class DatabaseList extends StatefulComponent {
  const DatabaseList({super.key});

  @override
  State createState() => _DatabaseListState();
}

class _DatabaseListState extends State<DatabaseList> {
  final client = mem.Client('http://localhost:8080/');

  List<mem.Member> memberList = [];
  List<mem.Member> filteredList = [];
  Map<int, int> jumlahBuktiMap = {};
  bool isLoading = false;
  bool hasFetchedMembers = false;

  // Sortir Tabel
  String sortColumn = 'namaPelanggan';
  bool isAscending = true;

  int currentPage = 1;
  final int rowsPerPage = 8;

  // Search
  String searchQuery = '';

  // Notifikasi
  String? notificationMessage;
  bool isNotificationSuccess = true;

  // State untuk KTP Popup
  bool isKtpPopupVisible = false;
  String? selectedKtpUrl;

  // State untuk Payment Popup
  bool isPaymentPopupVisible = false;
  List<String> selectedPaymentUrls = [];
  List<String> selectedPaymentDescriptions = [];
  int currentPaymentIndex = 0;

  // State untuk Edit Bukti (menampilkan DatabaseBuktiList)
  bool isEditBuktiVisible = false;
  mem.Member? selectedMemberForBukti;

  @override
  void initState() {
    super.initState();
    fetchMembers();
  }

  Future<void> fetchMembers() async {
    setState(() => isLoading = true);
    try {
      final members = await client.member.getAllMembers();

      final Map<int, int> tempBuktiMap = {};
      for (var member in members) {
        final buktiList = await client.databaseMember.getDatabaseMemberByPelangganId(member.id!);
        tempBuktiMap[member.id!] = buktiList.length;
      }

      setState(() {
        memberList = List.from(members);
        filteredList = List.from(members); // Initialize filtered list
        jumlahBuktiMap = tempBuktiMap;
        hasFetchedMembers = true;
      });
      // Sort by default: namaPelanggan ascending
      sortTable('namaPelanggan', true);
    } catch (e) {
      showNotification('Gagal mengambil data member: $e', false);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showNotification(String message, bool isSuccess) {
    setState(() {
      notificationMessage = message;
      isNotificationSuccess = isSuccess;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        notificationMessage = null;
      });
    });
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredList = memberList.where((member) {
        return member.namaPelanggan.toLowerCase().contains(searchQuery) ||
            member.nik.toString().contains(searchQuery) ||
            member.noWhatsapp.toLowerCase().contains(searchQuery);
      }).toList();
      currentPage = 1; // Reset to page 1 after search
    });
  }

  void sortTable(String column, [bool? ascending]) {
    setState(() {
      if (sortColumn == column) {
        isAscending = ascending ?? !isAscending; // Toggle sorting order
      } else {
        sortColumn = column;
        isAscending = ascending ?? true; // Default to ascending
      }

      filteredList.sort((a, b) {
        int compare;
        switch (column) {
          case 'nik':
            compare = a.nik.compareTo(b.nik);
            break;
          case 'noWhatsapp':
            compare = a.noWhatsapp.compareTo(b.noWhatsapp);
            break;
          case 'jumlahPembayaran':
            compare = (jumlahBuktiMap[a.id] ?? 0)
                .compareTo(jumlahBuktiMap[b.id] ?? 0);
            break;
          default:
            compare = a.namaPelanggan.compareTo(b.namaPelanggan);
        }
        return isAscending ? compare : -compare;
      });

      currentPage = 1; // Reset to first page after sorting
    });
  }

  int get totalPages => (filteredList.length / rowsPerPage).ceil();

  List<mem.Member> get paginatedList {
    final startIndex = (currentPage - 1) * rowsPerPage;
    final endIndex = startIndex + rowsPerPage;
    return filteredList.sublist(
      startIndex < filteredList.length ? startIndex : filteredList.length,
      endIndex < filteredList.length ? endIndex : filteredList.length,
    );
  }

  void nextPage() {
    if (currentPage < totalPages) setState(() => currentPage++);
  }

  void previousPage() {
    if (currentPage > 1) setState(() => currentPage--);
  }

  void openKtpPopup(String? ktpUrl) {
    if (ktpUrl == null) return;
    setState(() {
      selectedKtpUrl = ktpUrl;
      isKtpPopupVisible = true;
    });
  }

  void closeKtpPopup() {
    setState(() => isKtpPopupVisible = false);
  }

  void openPaymentPopup(mem.Member member) async {
    setState(() => isLoading = true);
    
    try {
      final buktiMember = await client.databaseMember.getDatabaseMemberByPelangganId(member.id!);
      
      if (buktiMember.isEmpty) {
        showNotification('Belum ada bukti pembayaran untuk member ini.', false);
        return;
      }

      setState(() {
        selectedPaymentUrls = buktiMember.map((b) => b.buktiPembayaran).toList();
        selectedPaymentDescriptions = buktiMember.map((b) => b.keterangan).toList();
        currentPaymentIndex = 0;
        isPaymentPopupVisible = true;
      });
    } catch (e) {
      showNotification('Gagal mengambil bukti pembayaran: $e', false);
    } finally {
      setState(() => isLoading = false);
    }
  }

  void closePaymentPopup() {
    setState(() => isPaymentPopupVisible = false);
  }

  void openEditBukti(mem.Member member) {
    setState(() {
      selectedMemberForBukti = member;
      isEditBuktiVisible = true;
    });
  }

  void closeEditBukti() {
    setState(() => isEditBuktiVisible = false);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (isLoading) {
      yield div([text('Memuat data...')]);
      return;
    }

    // Notifikasi
    if (notificationMessage != null) {
      yield div(
        classes: 'notif ${isNotificationSuccess ? "success" : "error"}',
        [text(notificationMessage!)],
      );
    }

    if (isKtpPopupVisible && selectedKtpUrl != null) {
      yield KtpPopup(
        ktpUrl: selectedKtpUrl!,
        onClose: closeKtpPopup,
      );
    }

    if (isPaymentPopupVisible) {
      yield PaymentPopup(
        paymentUrls: selectedPaymentUrls,
        paymentDescriptions: selectedPaymentDescriptions,
        currentIndex: currentPaymentIndex,
        onClose: closePaymentPopup,
      );
    }

    if (isEditBuktiVisible && selectedMemberForBukti != null) {
      yield DatabaseBuktiList(
        member: selectedMemberForBukti!,
        onClose: closeEditBukti,
        showNotification: showNotification,
      );
    } else {
      yield div(classes: 'database-list-container', [
        SearchBoxComponent(onSearch: handleSearch), 
        if (hasFetchedMembers && memberList.isEmpty)
          div(classes: 'no-data', [text('Belum ada member yang terdaftar.')])
        else if (filteredList.isEmpty)
          div(classes: 'no-data', [text('Tidak ditemukan member dengan pencarian: "$searchQuery".')])
        else
          table(classes: 'database-table', [
            thead([
              tr([
                th([
                  button(
                    classes: 'sort-button ${sortColumn == 'namaPelanggan' ? 'active ${!isAscending ? 'desc' : ''}' : ''}',
                    [
                      text('MEMBER'),
                      i([], classes: 'fa-solid fa-arrow-down'),
                    ],
                    onClick: () => sortTable('namaPelanggan'),
                  ),
                ]),
                th([
                  button(
                    classes: 'sort-button ${sortColumn == 'nik' ? 'active ${!isAscending ? 'desc' : ''}' : ''}',
                    [
                      text('NIK'),
                      i([], classes: 'fa-solid fa-arrow-down'),
                    ],
                    onClick: () => sortTable('nik'),
                  ),
                ]),
                th([
                  button(
                    classes: 'sort-button ${sortColumn == 'noWhatsapp' ? 'active ${!isAscending ? 'desc' : ''}' : ''}',
                    [
                      text('No. WhatsApp'),
                      i([], classes: 'fa-solid fa-arrow-down'),
                    ],
                    onClick: () => sortTable('noWhatsapp'),
                  ),
                ]),
                th([text('KTP')]),
                th([text('BUKTI PEMBAYARAN')]),
                th([
                  button(
                      classes: 'sort-button ${sortColumn == 'jumlahPembayaran' ? 'active ${!isAscending ? 'desc' : ''}' : ''}',
                      [
                        text('JUMLAH PEMBAYARAN'),
                        i([], classes: 'fa-solid fa-arrow-down'),
                      ],
                      onClick: () => sortTable('jumlahPembayaran'),
                    ),
                ]),
              ]),
            ]),
            tbody([
              for (final member in paginatedList)
                tr([
                  td([text(member.namaPelanggan)]),
                  td([text(member.nik.toString())]),
                  td([text(member.noWhatsapp)]),
                  td([
                    if (member.ktp != null)
                      img(
                        src: member.ktp!,
                        alt: 'KTP',
                        classes: 'ktp-image',
                        events: {
                          'click': (_) => openKtpPopup(member.ktp),
                        },
                      )
                    else
                      div([text('KTP Tidak Ada')]),
                  ]),
                  td([
                    div(classes: 'database-page-buttons',[
                      button(
                        classes: 'lihat-bukti-button',
                        onClick: () => openPaymentPopup(member),
                        [text('LIHAT BUKTI')],
                      ),
                      button(
                        classes: 'edit-bukti-button',
                        onClick: () => openEditBukti(member),
                        [text('EDIT BUKTI')],
                      ),
                    ])
                  ]),
                  td([
                    text(jumlahBuktiMap[member.id] != null ? jumlahBuktiMap[member.id].toString() : '0'),
                  ]),
                ]),
            ]),
          ]),

        // Pagination Controls
        div(classes: 'pagination', [
          if (currentPage > 1)
            button(
              classes: 'pagination-button',
              onClick: previousPage,
              [text('<')],
            ),
          text('Halaman $currentPage dari $totalPages'),
          if (currentPage < totalPages)
            button(
              classes: 'pagination-button',
              onClick: nextPage,
              [text('>')],
            ),
        ]),
      ]);
    }
  }
}
