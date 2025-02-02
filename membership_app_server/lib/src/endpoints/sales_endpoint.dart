import 'package:serverpod/serverpod.dart';
import '../generated/sales.dart';
import '../generated/member.dart'; // Untuk relasi Member

class SalesEndpoint extends Endpoint {
  // Fetch all sales
  Future<List<Sales>> getAllSales(Session session) async {
    // Ambil semua data Sales
    final salesList = await Sales.db.find(session);

    // Untuk setiap Sales, temukan member berdasarkan salesPelangganSalesId
    for (final sales in salesList) {
      sales.pelanggan = await Member.db.find(
        session,
        where: (m) => m.salesPelangganSalesId.equals(sales.id),
      );
    }

    return salesList;
  }


  // Fetch a single sales by ID
  Future<Sales?> getSalesById(Session session, int id) async {
    return await Sales.db.findById(session, id);
  }

  // Insert a new sales
  Future<bool> addSales(Session session, Sales sales) async {
    try {
      final result = await Sales.db.insertRow(session, sales);
      return result.id != null;
    } catch (e, stack) {
      session.log('Error adding sales: $e');
      session.log(stack.toString());
      return false;
    }
  }

  // Update an existing sales
  Future<bool> updateSales(Session session, Sales sales) async {
    try {
      final result = await Sales.db.updateRow(session, sales);
      return result.id != null;
    } catch (e, stack) {
      session.log('Error updating sales: $e');
      session.log(stack.toString());
      return false;
    }
  }

  // Delete a sales by ID
  Future<bool> deleteSales(Session session, int id) async {
    try {
      final deletedRows = await Sales.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return deletedRows.isNotEmpty;
    } catch (e, stack) {
      session.log('Error deleting sales: $e');
      session.log(stack.toString());
      return false;
    }
  }

  // Fetch members related to a sales
  Future<List<Member>> getSalesMembers(Session session, int salesId) async {
    try {
      // Temukan semua Member yang terkait dengan salesId tertentu
      return await Member.db.find(
        session,
        where: (m) => m.salesPelangganSalesId.equals(salesId),
      );
    } catch (e, stack) {
      session.log('Error fetching sales members: $e');
      session.log(stack.toString());
      return [];
    }
  }


  // Add a member to sales
  Future<bool> addMemberToSales(Session session, int salesId, Member member) async {
  try {
    // Temukan objek Sales
    final sales = await Sales.db.findById(session, salesId);
    if (sales == null) {
      return false;
    }

    // Tambahkan Member ke dalam relasi pelanggan
    final updatedPelanggan = sales.pelanggan ?? [];
    updatedPelanggan.add(member.copyWith(salesPelangganSalesId: salesId));

    // Perbarui objek Sales dengan relasi pelanggan baru
    final updatedSales = sales.copyWith(pelanggan: updatedPelanggan);
    await Sales.db.updateRow(session, updatedSales);
    return true;
  } catch (e, stack) {
    session.log('Error adding member to sales: $e');
    session.log(stack.toString());
    return false;
  }
}


  // Remove a member from sales
  Future<bool> removeMemberFromSales(Session session, int salesId, int memberId) async {
    try {
      final sales = await Sales.db.findById(session, salesId);
      if (sales == null) {
        return false;
      }

      final updatedPelanggan = (sales.pelanggan ?? []).where((m) => m.id != memberId).toList();

      final updatedSales = sales.copyWith(pelanggan: updatedPelanggan);
      await Sales.db.updateRow(session, updatedSales);
      return true;
    } catch (e, stack) {
      session.log('Error removing member from sales: $e');
      session.log(stack.toString());
      return false;
    }
  }
}
