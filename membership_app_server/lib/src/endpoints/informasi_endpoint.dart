import 'package:serverpod/serverpod.dart';
import '../generated/informasi.dart';

class InformasiEndpoint extends Endpoint {
  // Fetch all rows
  Future<List<Informasi>> getAllInformasi(Session session) async {
    return await Informasi.db.find(session);
  }

  // Fetch a single row by ID
  Future<Informasi?> getInformasiById(Session session, int id) async {
    return await Informasi.db.findById(session, id);
  }

  // Insert a new row
  Future<Informasi> addInformasi(Session session, Informasi informasi) async {
    return await Informasi.db.insertRow(session, informasi);
  }

  // Update an existing row
  Future<Informasi> updateInformasi(Session session, Informasi informasi) async {
    return await Informasi.db.updateRow(session, informasi);
  }

  // Delete a row by ID
  Future<bool> deleteInformasi(Session session, {required int id}) async {
    final deletedRows = await Informasi.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deletedRows.isNotEmpty;
  }

}
