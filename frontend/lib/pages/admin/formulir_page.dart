import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/formulir_list.dart';
import '../../components/admin/formulir_form.dart';
import '../../components/admin/formulir_detail.dart';

@client
class FormulirPage extends StatefulComponent {
  const FormulirPage({super.key});

  @override
  State createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  final client = Client('http://localhost:8080/');

  List<Member> memberList = [];
  List<Sales> salesList = [];
  Member? selectedMember;
  String currentView = 'list'; 
  bool isLoading = false;

  // Untuk notifikasi
  String? notificationMessage;
  bool isNotificationSuccess = true;

  // Filter & search
  String currentFilter = 'Semua'; // 'Semua', 'Valid', 'Belum Valid'
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    setState(() => isLoading = true);
    try {
      // Ambil semua member
      final members = await client.member.getAllMembers();
      final salesData = await client.sales.getAllSales();
      setState(() {
        memberList = members;
        salesList = salesData;
      });
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Tambahkan member baru
  Future<void> addMemberAndSales(Member member, int? salesId) async {
    if (salesId == null) {
      showNotification('Pilih Sales terlebih dahulu.', false);
      return;
    }

    setState(() => isLoading = true);

    try {
      // Tambah member ke database
      final isMemberAdded = await client.member.addMember(member);

      if (isMemberAdded) {
        // Kaitkan member dengan sales
        final isLinked = await client.sales.addMemberToSales(salesId, member);

        if (isLinked) {
          showNotification('Member berhasil ditambahkan ke Sales.', true);
          fetchAllData(); // Refresh data jika perlu
        } else {
          showNotification('Gagal menambahkan member ke Sales.', false);
        }
      } else {
        showNotification('Gagal menambahkan member.', false);
      }
    } catch (e) {
      print('Error: $e');
      showNotification('Terjadi kesalahan saat menambahkan member.', false);
    } finally {
      setState(() {
        isLoading = false;
        currentView = 'list';
      });
    }
  }


  // Lihat detail member
  void viewDetail(Member member) {
    setState(() {
      selectedMember = member;
      currentView = 'detail';
    });
  }

  // Notifikasi
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

  // Ganti filter
  void setFilter(String filter) {
    setState(() => currentFilter = filter);
  }

  // Ganti search
  void setSearch(String query) {
    setState(() => searchQuery = query);
  }

  // Kembalikan ke list
  void backToList() {
    setState(() {
      currentView = 'list';
      selectedMember = null;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'formulir-page', [
        // Notifikasi
        if (notificationMessage != null)
          div(
            classes: isNotificationSuccess ? 'notif success' : 'notif error',
            [text(notificationMessage!)],
          ),

        if (isLoading) 
          div([text('Memuat data...')])
        else if (currentView == 'list') ...[
          FormulirList(
            members: memberList,
            currentFilter: currentFilter,
            searchQuery: searchQuery,
            onFilterChange: setFilter,
            onSearchChange: setSearch,
            onAddFormulir: () => setState(() => currentView = 'form'),
            onViewDetail: viewDetail,
          ),
        ] else if (currentView == 'form') ...[
          // Tampilkan form
          FormulirForm(
            salesList: salesList,
            onSubmit: (member, salesId) => addMemberAndSales(member, salesId),
            onCancel: backToList,
            showNotification: showNotification,
          ),
        ] else if (currentView == 'detail') ...[
          if (selectedMember != null)
            FormulirDetail(
              member: selectedMember!,
              onBack: backToList,
            )
          else
            div([text('Member tidak ditemukan')]),
        ],
      ]),
    );
  }
}
