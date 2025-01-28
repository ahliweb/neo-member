import 'package:serverpod/serverpod.dart';
import '../generated/database_member.dart';

class DatabaseMemberEndpoint extends Endpoint {
  // Fetch all rows
  Future<List<DatabaseMember>> getAllDatabaseMembers(Session session) async {
    return await DatabaseMember.db.find(session);
  }


  // Fetch a single row by ID
  Future<DatabaseMember?> getDatabaseMemberById(Session session, int id) async {
    return await DatabaseMember.db.findById(session, id);
  }



  // Insert a new row
  Future<bool> addDatabaseMember(Session session, DatabaseMember databaseMember) async {
    final result = await DatabaseMember.db.insertRow(session, databaseMember);
    return result.id != null;
  }


  // Update an existing row
  Future<bool> updateDatabaseMember(Session session, DatabaseMember databaseMember) async {
    final result = await DatabaseMember.db.updateRow(session, databaseMember);
    return result.id != null;
  }



  // Delete a row by ID
  Future<bool> deleteDatabaseMember(Session session, int id) async {
    final deletedRows = await DatabaseMember.db.deleteWhere(session, where: (t) => t.id.equals(id));
    return deletedRows.isNotEmpty;
  }


}
