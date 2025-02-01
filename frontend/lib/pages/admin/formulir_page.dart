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

  List<MemberWithSalesName> memberList = [];
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

      // Buat list enriched
      final List<MemberWithSalesName> enriched = [];
      for (final m in members) {
        String nameSales = '-';
        if (m.salesPelangganSalesId != null) {
          final s = await client.sales.getSalesById(m.salesPelangganSalesId!);
          if (s != null) {
            nameSales = s.namaSales;
          }
        }
        enriched.add(MemberWithSalesName(member: m, salesName: nameSales));
      }

      setState(() {
        memberList = enriched;  // <- Pastikan Tipe data memberList = List<MemberWithSalesName>
        salesList = salesData;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() => isLoading = false);
    }
  }


  Future<String?> fetchSalesName(int salesId) async {
    try {
      final sales = await client.sales.getSalesById(salesId);
      return sales?.namaSales;
    } catch (e) {
      print('Error fetching salesName: $e');
      return null;
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
      // Update salesPelangganSalesId sebelum menyimpan
      final updatedMember = member.copyWith(salesPelangganSalesId: salesId);
      final isMemberAdded = await client.member.addMember(updatedMember);

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
            fetchSalesName: fetchSalesName,
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
              fetchSales: (salesId) => client.sales.getSalesById(salesId),
              onBack: backToList,
            )
          else
            div([text('Member tidak ditemukan')]),
        ],
      ]),
    );
  }
}
