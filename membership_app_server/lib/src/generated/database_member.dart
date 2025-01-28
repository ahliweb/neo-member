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
import 'member.dart' as _i2;

abstract class DatabaseMember
    implements _i1.TableRow, _i1.ProtocolSerialization {
  DatabaseMember._({
    this.id,
    this.buktiPembayaran,
    required this.idPembayaran,
    this.nikPelanggan,
  });

  factory DatabaseMember({
    int? id,
    List<String>? buktiPembayaran,
    required int idPembayaran,
    _i2.Member? nikPelanggan,
  }) = _DatabaseMemberImpl;

  factory DatabaseMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return DatabaseMember(
      id: jsonSerialization['id'] as int?,
      buktiPembayaran: (jsonSerialization['buktiPembayaran'] as List?)
          ?.map((e) => e as String)
          .toList(),
      idPembayaran: jsonSerialization['idPembayaran'] as int,
      nikPelanggan: jsonSerialization['nikPelanggan'] == null
          ? null
          : _i2.Member.fromJson(
              (jsonSerialization['nikPelanggan'] as Map<String, dynamic>)),
    );
  }

  static final t = DatabaseMemberTable();

  static const db = DatabaseMemberRepository._();

  @override
  int? id;

  List<String>? buktiPembayaran;

  int idPembayaran;

  _i2.Member? nikPelanggan;

  @override
  _i1.Table get table => t;

  DatabaseMember copyWith({
    int? id,
    List<String>? buktiPembayaran,
    int? idPembayaran,
    _i2.Member? nikPelanggan,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (buktiPembayaran != null) 'buktiPembayaran': buktiPembayaran?.toJson(),
      'idPembayaran': idPembayaran,
      if (nikPelanggan != null) 'nikPelanggan': nikPelanggan?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (buktiPembayaran != null) 'buktiPembayaran': buktiPembayaran?.toJson(),
      'idPembayaran': idPembayaran,
      if (nikPelanggan != null)
        'nikPelanggan': nikPelanggan?.toJsonForProtocol(),
    };
  }

  static DatabaseMemberInclude include({_i2.MemberInclude? nikPelanggan}) {
    return DatabaseMemberInclude._(nikPelanggan: nikPelanggan);
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
    List<String>? buktiPembayaran,
    required int idPembayaran,
    _i2.Member? nikPelanggan,
  }) : super._(
          id: id,
          buktiPembayaran: buktiPembayaran,
          idPembayaran: idPembayaran,
          nikPelanggan: nikPelanggan,
        );

  @override
  DatabaseMember copyWith({
    Object? id = _Undefined,
    Object? buktiPembayaran = _Undefined,
    int? idPembayaran,
    Object? nikPelanggan = _Undefined,
  }) {
    return DatabaseMember(
      id: id is int? ? id : this.id,
      buktiPembayaran: buktiPembayaran is List<String>?
          ? buktiPembayaran
          : this.buktiPembayaran?.map((e0) => e0).toList(),
      idPembayaran: idPembayaran ?? this.idPembayaran,
      nikPelanggan: nikPelanggan is _i2.Member?
          ? nikPelanggan
          : this.nikPelanggan?.copyWith(),
    );
  }
}

class DatabaseMemberTable extends _i1.Table {
  DatabaseMemberTable({super.tableRelation})
      : super(tableName: 'database_member') {
    buktiPembayaran = _i1.ColumnSerializable(
      'buktiPembayaran',
      this,
    );
    idPembayaran = _i1.ColumnInt(
      'idPembayaran',
      this,
    );
  }

  late final _i1.ColumnSerializable buktiPembayaran;

  late final _i1.ColumnInt idPembayaran;

  _i2.MemberTable? _nikPelanggan;

  _i2.MemberTable get nikPelanggan {
    if (_nikPelanggan != null) return _nikPelanggan!;
    _nikPelanggan = _i1.createRelationTable(
      relationFieldName: 'nikPelanggan',
      field: DatabaseMember.t.idPembayaran,
      foreignField: _i2.Member.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MemberTable(tableRelation: foreignTableRelation),
    );
    return _nikPelanggan!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        buktiPembayaran,
        idPembayaran,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'nikPelanggan') {
      return nikPelanggan;
    }
    return null;
  }
}

class DatabaseMemberInclude extends _i1.IncludeObject {
  DatabaseMemberInclude._({_i2.MemberInclude? nikPelanggan}) {
    _nikPelanggan = nikPelanggan;
  }

  _i2.MemberInclude? _nikPelanggan;

  @override
  Map<String, _i1.Include?> get includes => {'nikPelanggan': _nikPelanggan};

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

  final attachRow = const DatabaseMemberAttachRowRepository._();

  Future<List<DatabaseMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DatabaseMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DatabaseMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DatabaseMemberTable>? orderByList,
    _i1.Transaction? transaction,
    DatabaseMemberInclude? include,
  }) async {
    return session.db.find<DatabaseMember>(
      where: where?.call(DatabaseMember.t),
      orderBy: orderBy?.call(DatabaseMember.t),
      orderByList: orderByList?.call(DatabaseMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    DatabaseMemberInclude? include,
  }) async {
    return session.db.findFirstRow<DatabaseMember>(
      where: where?.call(DatabaseMember.t),
      orderBy: orderBy?.call(DatabaseMember.t),
      orderByList: orderByList?.call(DatabaseMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<DatabaseMember?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DatabaseMemberInclude? include,
  }) async {
    return session.db.findById<DatabaseMember>(
      id,
      transaction: transaction,
      include: include,
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

class DatabaseMemberAttachRowRepository {
  const DatabaseMemberAttachRowRepository._();

  Future<void> nikPelanggan(
    _i1.Session session,
    DatabaseMember databaseMember,
    _i2.Member nikPelanggan, {
    _i1.Transaction? transaction,
  }) async {
    if (databaseMember.id == null) {
      throw ArgumentError.notNull('databaseMember.id');
    }
    if (nikPelanggan.id == null) {
      throw ArgumentError.notNull('nikPelanggan.id');
    }

    var $databaseMember =
        databaseMember.copyWith(idPembayaran: nikPelanggan.id);
    await session.db.updateRow<DatabaseMember>(
      $databaseMember,
      columns: [DatabaseMember.t.idPembayaran],
      transaction: transaction,
    );
  }
}
