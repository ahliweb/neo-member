/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class DatabaseMember
    implements _i1.TableRow, _i1.ProtocolSerialization {
  DatabaseMember._({
    this.id,
    required this.buktiPembayaran,
    required this.keterangan,
    required this.pelangganId,
  });

  factory DatabaseMember({
    int? id,
    required String buktiPembayaran,
    required String keterangan,
    required int pelangganId,
  }) = _DatabaseMemberImpl;

  factory DatabaseMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return DatabaseMember(
      id: jsonSerialization['id'] as int?,
      buktiPembayaran: jsonSerialization['buktiPembayaran'] as String,
      keterangan: jsonSerialization['keterangan'] as String,
      pelangganId: jsonSerialization['pelangganId'] as int,
    );
  }

  static final t = DatabaseMemberTable();

  static const db = DatabaseMemberRepository._();

  @override
  int? id;

  String buktiPembayaran;

  String keterangan;

  int pelangganId;

  @override
  _i1.Table get table => t;

  DatabaseMember copyWith({
    int? id,
    String? buktiPembayaran,
    String? keterangan,
    int? pelangganId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'buktiPembayaran': buktiPembayaran,
      'keterangan': keterangan,
      'pelangganId': pelangganId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'buktiPembayaran': buktiPembayaran,
      'keterangan': keterangan,
      'pelangganId': pelangganId,
    };
  }

  static DatabaseMemberInclude include() {
    return DatabaseMemberInclude._();
  }

  static DatabaseMemberIncludeList includeList({
    _i1.WhereExpressionBuilder<DatabaseMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DatabaseMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DatabaseMemberTable>? orderByList,
    DatabaseMemberInclude? include,
  }) {
    return DatabaseMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DatabaseMember.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DatabaseMember.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DatabaseMemberImpl extends DatabaseMember {
  _DatabaseMemberImpl({
    int? id,
    required String buktiPembayaran,
    required String keterangan,
    required int pelangganId,
  }) : super._(
          id: id,
          buktiPembayaran: buktiPembayaran,
          keterangan: keterangan,
          pelangganId: pelangganId,
        );

  @override
  DatabaseMember copyWith({
    Object? id = _Undefined,
    String? buktiPembayaran,
    String? keterangan,
    int? pelangganId,
  }) {
    return DatabaseMember(
      id: id is int? ? id : this.id,
      buktiPembayaran: buktiPembayaran ?? this.buktiPembayaran,
      keterangan: keterangan ?? this.keterangan,
      pelangganId: pelangganId ?? this.pelangganId,
    );
  }
}

class DatabaseMemberTable extends _i1.Table {
  DatabaseMemberTable({super.tableRelation})
      : super(tableName: 'database_member') {
    buktiPembayaran = _i1.ColumnString(
      'buktiPembayaran',
      this,
    );
    keterangan = _i1.ColumnString(
      'keterangan',
      this,
    );
    pelangganId = _i1.ColumnInt(
      'pelangganId',
      this,
    );
  }

  late final _i1.ColumnString buktiPembayaran;

  late final _i1.ColumnString keterangan;

  late final _i1.ColumnInt pelangganId;

  @override
  List<_i1.Column> get columns => [
        id,
        buktiPembayaran,
        keterangan,
        pelangganId,
      ];
}

class DatabaseMemberInclude extends _i1.IncludeObject {
  DatabaseMemberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DatabaseMember.t;
}

class DatabaseMemberIncludeList extends _i1.IncludeList {
  DatabaseMemberIncludeList._({
    _i1.WhereExpressionBuilder<DatabaseMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DatabaseMember.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DatabaseMember.t;
}

class DatabaseMemberRepository {
  const DatabaseMemberRepository._();

  Future<List<DatabaseMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DatabaseMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DatabaseMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DatabaseMemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DatabaseMember>(
      where: where?.call(DatabaseMember.t),
      orderBy: orderBy?.call(DatabaseMember.t),
      orderByList: orderByList?.call(DatabaseMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DatabaseMember?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DatabaseMemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<DatabaseMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DatabaseMemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DatabaseMember>(
      where: where?.call(DatabaseMember.t),
      orderBy: orderBy?.call(DatabaseMember.t),
      orderByList: orderByList?.call(DatabaseMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DatabaseMember?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DatabaseMember>(
      id,
      transaction: transaction,
    );
  }

  Future<List<DatabaseMember>> insert(
    _i1.Session session,
    List<DatabaseMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DatabaseMember>(
      rows,
      transaction: transaction,
    );
  }

  Future<DatabaseMember> insertRow(
    _i1.Session session,
    DatabaseMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DatabaseMember>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DatabaseMember>> update(
    _i1.Session session,
    List<DatabaseMember> rows, {
    _i1.ColumnSelections<DatabaseMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DatabaseMember>(
      rows,
      columns: columns?.call(DatabaseMember.t),
      transaction: transaction,
    );
  }

  Future<DatabaseMember> updateRow(
    _i1.Session session,
    DatabaseMember row, {
    _i1.ColumnSelections<DatabaseMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DatabaseMember>(
      row,
      columns: columns?.call(DatabaseMember.t),
      transaction: transaction,
    );
  }

  Future<List<DatabaseMember>> delete(
    _i1.Session session,
    List<DatabaseMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DatabaseMember>(
      rows,
      transaction: transaction,
    );
  }

  Future<DatabaseMember> deleteRow(
    _i1.Session session,
    DatabaseMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DatabaseMember>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DatabaseMember>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DatabaseMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DatabaseMember>(
      where: where(DatabaseMember.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DatabaseMemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DatabaseMember>(
      where: where?.call(DatabaseMember.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
