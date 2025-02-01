import 'package:serverpod/serverpod.dart';
import '../generated/database_member.dart';
import '../generated/member.dart';

class DatabaseMemberEndpoint extends Endpoint {
  // **Fetch semua data database_member**
  Future<List<DatabaseMember>> getAllDatabaseMembers(Session session) async {
    return await DatabaseMember.db.find(session);
  }

  // **Fetch satu database_member berdasarkan ID**
  Future<DatabaseMember?> getDatabaseMemberById(Session session, int id) async {
    return await DatabaseMember.db.findById(session, id);
  }

  // **Fetch database_member berdasarkan pelangganId**
  Future<List<DatabaseMember>> getDatabaseMemberByPelangganId(Session session, int pelangganId) async {
    return await DatabaseMember.db.find(
      session,
      where: (t) => t.pelangganId.equals(pelangganId),
    );
  }

  // **Tambah bukti pembayaran baru untuk pelanggan tertentu**
  Future<bool> addDatabaseMember(Session session, DatabaseMember databaseMember) async {
    try {
      // Cek apakah pelanggan dengan ID ini ada di database
      final pelanggan = await Member.db.findById(session, databaseMember.pelangganId);
      if (pelanggan == null) {
        session.log('Pelanggan dengan ID ${databaseMember.pelangganId} tidak ditemukan.');
        return false;
      }

      // Insert data baru ke database
      final result = await DatabaseMember.db.insertRow(session, databaseMember);
      return result.id != null;
    } catch (e, stackTrace) {
      session.log('Error adding database member: $e');
      session.log(stackTrace.toString());
      return false;
    }
  }

  // **Update bukti pembayaran dan keterangan berdasarkan ID**
  Future<bool> updateDatabaseMember(Session session, DatabaseMember databaseMember) async {
    try {
      final existing = await DatabaseMember.db.findById(session, databaseMember.id!);
      if (existing == null) {
        session.log('DatabaseMember dengan ID ${databaseMember.id} tidak ditemukan.');
        return false;
      }

      final result = await DatabaseMember.db.updateRow(session, databaseMember);
      return result.id != null;
    } catch (e, stackTrace) {
      session.log('Error updating database member: $e');
      session.log(stackTrace.toString());
      return false;
    }
  }

  // **Hapus bukti pembayaran berdasarkan ID**
  Future<bool> deleteDatabaseMember(Session session, int id) async {
    try {
      final deletedRows = await DatabaseMember.db.deleteWhere(
        session,
        where: (t) => t.id.equals(id),
      );
      return deletedRows.isNotEmpty;
    } catch (e, stackTrace) {
      session.log('Error deleting database member: $e');
      session.log(stackTrace.toString());
      return false;
    }
  }
}

