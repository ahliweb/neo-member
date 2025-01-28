import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/sales_table.dart';
import '../../components/admin/sales_form.dart';
import '../../components/admin/sales_delete_popup.dart';
import '../../components/admin/sales_members_list.dart';

@client
class SalesPage extends StatefulComponent {
  const SalesPage({super.key});

  @override
  State createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final client = Client('http://localhost:8080/');
  List<Sales> salesList = [];
  List<Member> membersList = [];
  Sales? selectedSales;
  String currentView = 'list';
  String searchQuery = '';
  bool isLoading = true;
  String? notificationMessage;
  bool isNotificationSuccess = true; // Default success state


  @override
  void initState() {
    super.initState();
    fetchSales();
  }

  
  Future<void> fetchSales() async {
    try {
      final salesData = await client.sales.getAllSales();
      setState(() {
        salesList = salesData;
        isLoading = false; // Data berhasil diambil, ubah isLoading menjadi false
      });
      print('Sales Data: $salesList'); // Memastikan data berhasil diambil
    } catch (e) {
      setState(() {
        isLoading = false; // Tetap ubah isLoading agar tidak memuat terus-menerus
      });
      print('Error fetching sales data: $e');
    }
  }

  Future<void> fetchMembers(int salesId) async {
    setState(() => isLoading = true);
    try {
      final sales = salesList.isNotEmpty
          ? salesList.firstWhere(
              (s) => s.id == salesId,
              orElse: () => Sales(id: null, namaSales: 'Tidak Diketahui', nik: '', noWhatsapp: ''),
            )
          : null;
      selectedSales = sales?.id != null ? sales : null; // Jika ID null, anggap sales tidak ditemukan
      membersList = await client.sales.getSalesMembers(salesId);
    } catch (e) {
      print('Error fetching members: $e');
    } finally {
      setState(() {
        currentView = 'members';
        isLoading = false;
      });
    }
  }



  void switchView(String view, {Sales? sales}) {
    setState(() {
      currentView = view;
      selectedSales = sales;
      print('Switched to view: $currentView');
      if (selectedSales != null) {
        print('Selected sales: ${selectedSales!.namaSales}');
      }
    });
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




  Future<void> addOrUpdateSales(Sales sales) async {
    setState(() => isLoading = true);
    try {
      if (sales.id == null) {
        await client.sales.addSales(sales);
      } else {
        await client.sales.updateSales(sales);
      }
      fetchSales();
    } catch (e) {
      print('Error saving sales: $e');
    } finally {
      setState(() => currentView = 'list');
    }
  }

  Future<void> deleteSales(int salesId) async {
    setState(() => isLoading = true);
    try {
      await client.sales.deleteSales(salesId);
      fetchSales();
    } catch (e) {
      print('Error deleting sales: $e');
    } finally {
      setState(() => currentView = 'list');
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'sales-page', [
        h1([text('Data Sales')]),
        // Notifikasi
        if (notificationMessage != null)
          div(
            classes: isNotificationSuccess ? 'notif success' : 'notif error',
            [text(notificationMessage!)],
          ),
        if (isLoading)
          div([text('Memuat data sales...')])
            // div(classes: 'loading-overlay', [
            //   div([],classes: 'loading-spinner'),
            //   div(classes: 'loading-text', [text('Memuat data...')]),
            // ]),
        else if (currentView == 'list') ...[
          div(classes: 'header-with-search', [
            input(
              [],
              type: InputType.text,
              attributes: {'placeholder': 'Cari'},
              classes: 'search-input',
              onInput: (value) => setState(() => searchQuery = value as String),
            ),
          ]),
          SalesTable(
            salesList: salesList.where((sales) {
              final query = searchQuery.toLowerCase();
              return sales.namaSales.toLowerCase().contains(query) ||
                  sales.nik.toLowerCase().contains(query) ||
                  sales.noWhatsapp.toLowerCase().contains(query);
            }).toList(),
            searchQuery: searchQuery,
            onEdit: (sales) => switchView('edit', sales: sales),
            onDelete: (sales) => switchView('delete', sales: sales),
            onViewMembers: (sales) => fetchMembers(sales.id!),
          ),
          button(
            classes: 'add-button',
            onClick: () => switchView('create'),
            [text('+ Tambah Sales')],
          ),
        ] else if (currentView == 'create' || currentView == 'edit') ...[
          SalesForm(
            sales: selectedSales,
            existingSalesList: salesList, // Daftar sales untuk validasi NIK
            onSubmit: addOrUpdateSales,
            onCancel: () => switchView('list'),
            showNotification: (message, isSuccess) => showNotification(message, isSuccess),
          ),
        ] else if (currentView == 'delete') ...[
          SalesDeletePopup(
            onConfirm: () {
              if (selectedSales != null) deleteSales(selectedSales!.id!);
            },
            onCancel: () => switchView('list'),
            showNotification: (message, isSuccess) => showNotification(message, isSuccess),
          ),
        ] else if (currentView == 'members') ...[
          SalesMembersList(
            salesName: selectedSales?.namaSales ?? 'Tidak Diketahui', // Pastikan ini tidak null
            members: membersList,
            onBack: () => switchView('list'),
          ),
        ],
        
      ]),
    );
  }
}
