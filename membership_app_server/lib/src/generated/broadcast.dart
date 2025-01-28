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

abstract class Broadcast implements _i1.TableRow, _i1.ProtocolSerialization {
  Broadcast._({
    this.id,
    required this.pesan,
    required this.tujuan,
    required this.tanggalDibuat,
  });

  factory Broadcast({
    int? id,
    required String pesan,
    required int tujuan,
    required DateTime tanggalDibuat,
  }) = _BroadcastImpl;

  factory Broadcast.fromJson(Map<String, dynamic> jsonSerialization) {
    return Broadcast(
      id: jsonSerialization['id'] as int?,
      pesan: jsonSerialization['pesan'] as String,
      tujuan: jsonSerialization['tujuan'] as int,
      tanggalDibuat: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['tanggalDibuat']),
    );
  }

  static final t = BroadcastTable();

  static const db = BroadcastRepository._();

  @override
  int? id;

  String pesan;

  int tujuan;

  DateTime tanggalDibuat;

  @override
  _i1.Table get table => t;

  Broadcast copyWith({
    int? id,
    String? pesan,
    int? tujuan,
    DateTime? tanggalDibuat,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pesan': pesan,
      'tujuan': tujuan,
      'tanggalDibuat': tanggalDibuat.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pesan': pesan,
      'tujuan': tujuan,
      'tanggalDibuat': tanggalDibuat.toJson(),
    };
  }

  static BroadcastInclude include() {
    return BroadcastInclude._();
  }

  static BroadcastIncludeList includeList({
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BroadcastTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BroadcastTable>? orderByList,
    BroadcastInclude? include,
  }) {
    return BroadcastIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Broadcast.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Broadcast.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BroadcastImpl extends Broadcast {
  _BroadcastImpl({
    int? id,
    required String pesan,
    required int tujuan,
    required DateTime tanggalDibuat,
  }) : super._(
          id: id,
          pesan: pesan,
          tujuan: tujuan,
          tanggalDibuat: tanggalDibuat,
        );

  @override
  Broadcast copyWith({
    Object? id = _Undefined,
    String? pesan,
    int? tujuan,
    DateTime? tanggalDibuat,
  }) {
    return Broadcast(
      id: id is int? ? id : this.id,
      pesan: pesan ?? this.pesan,
      tujuan: tujuan ?? this.tujuan,
      tanggalDibuat: tanggalDibuat ?? this.tanggalDibuat,
    );
  }
}

class BroadcastTable extends _i1.Table {
  BroadcastTable({super.tableRelation}) : super(tableName: 'broadcast') {
    pesan = _i1.ColumnString(
      'pesan',
      this,
    );
    tujuan = _i1.ColumnInt(
      'tujuan',
      this,
    );
    tanggalDibuat = _i1.ColumnDateTime(
      'tanggalDibuat',
      this,
    );
  }

  late final _i1.ColumnString pesan;

  late final _i1.ColumnInt tujuan;

  late final _i1.ColumnDateTime tanggalDibuat;

  @override
  List<_i1.Column> get columns => [
        id,
        pesan,
        tujuan,
        tanggalDibuat,
      ];
}

class BroadcastInclude extends _i1.IncludeObject {
  BroadcastInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Broadcast.t;
}

class BroadcastIncludeList extends _i1.IncludeList {
  BroadcastIncludeList._({
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Broadcast.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Broadcast.t;
}

class BroadcastRepository {
  const BroadcastRepository._();

  Future<List<Broadcast>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BroadcastTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BroadcastTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Broadcast>(
      where: where?.call(Broadcast.t),
      orderBy: orderBy?.call(Broadcast.t),
      orderByList: orderByList?.call(Broadcast.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Broadcast?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? offset,
    _i1.OrderByBuilder<BroadcastTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BroadcastTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Broadcast>(
      where: where?.call(Broadcast.t),
      orderBy: orderBy?.call(Broadcast.t),
      orderByList: orderByList?.call(Broadcast.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Broadcast?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Broadcast>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Broadcast>> insert(
    _i1.Session session,
    List<Broadcast> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Broadcast>(
      rows,
      transaction: transaction,
    );
  }

  Future<Broadcast> insertRow(
    _i1.Session session,
    Broadcast row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Broadcast>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Broadcast>> update(
    _i1.Session session,
    List<Broadcast> rows, {
    _i1.ColumnSelections<BroadcastTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Broadcast>(
      rows,
      columns: columns?.call(Broadcast.t),
      transaction: transaction,
    );
  }

  Future<Broadcast> updateRow(
    _i1.Session session,
    Broadcast row, {
    _i1.ColumnSelections<BroadcastTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Broadcast>(
      row,
      columns: columns?.call(Broadcast.t),
      transaction: transaction,
    );
  }

  Future<List<Broadcast>> delete(
    _i1.Session session,
    List<Broadcast> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Broadcast>(
      rows,
      transaction: transaction,
    );
  }

  Future<Broadcast> deleteRow(
    _i1.Session session,
    Broadcast row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Broadcast>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Broadcast>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BroadcastTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Broadcast>(
      where: where(Broadcast.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Broadcast>(
      where: where?.call(Broadcast.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
