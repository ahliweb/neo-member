import 'package:serverpod/serverpod.dart';
import '../generated/member.dart';

class MemberEndpoint extends Endpoint {
  // Fetch all rows
  Future<List<Member>> getAllMembers(Session session) async {
    return await Member.db.find(session);
  }


  // Fetch a single row by ID
  Future<Member?> getMemberById(Session session, int id) async {
    return await Member.db.findById(session, id);
  }


  // Insert a new row
  Future<bool> addMember(Session session, Member member) async {
    try {
      // Pastikan tanggalDibuat diisi dengan waktu saat ini
      member = member.copyWith(tanggalDibuat: DateTime.now());

      final result = await Member.db.insertRow(session, member);
      return result.id != null;
    } catch (e, stack) {
      session.log('Error adding member: $e');
      session.log(stack.toString());
      return false;
    }
  }



  // Update an existing row
  Future<bool> updateMember(Session session, Member member) async {
    final result = await Member.db.updateRow(session, member);
    return result.id != null;
  }


  // Delete a row by ID
  Future<bool> deleteMember(Session session, int id) async {
    final deletedRows = await Member.db.deleteWhere(session, where: (t) => t.id.equals(id));
    return deletedRows.isNotEmpty;
  }


}
