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

abstract class Informasi implements _i1.TableRow, _i1.ProtocolSerialization {
  Informasi._({
    this.id,
    required this.tujuan,
    required this.tanggalDibuat,
    required this.judul,
    required this.deskripsi,
  });

  factory Informasi({
    int? id,
    required String tujuan,
    required DateTime tanggalDibuat,
    required String judul,
    required String deskripsi,
  }) = _InformasiImpl;

  factory Informasi.fromJson(Map<String, dynamic> jsonSerialization) {
    return Informasi(
      id: jsonSerialization['id'] as int?,
      tujuan: jsonSerialization['tujuan'] as String,
      tanggalDibuat: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['tanggalDibuat']),
      judul: jsonSerialization['judul'] as String,
      deskripsi: jsonSerialization['deskripsi'] as String,
    );
  }

  static final t = InformasiTable();

  static const db = InformasiRepository._();

  @override
  int? id;

  String tujuan;

  DateTime tanggalDibuat;

  String judul;

  String deskripsi;

  @override
  _i1.Table get table => t;

  Informasi copyWith({
    int? id,
    String? tujuan,
    DateTime? tanggalDibuat,
    String? judul,
    String? deskripsi,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tujuan': tujuan,
      'tanggalDibuat': tanggalDibuat.toJson(),
      'judul': judul,
      'deskripsi': deskripsi,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tujuan': tujuan,
      'tanggalDibuat': tanggalDibuat.toJson(),
      'judul': judul,
      'deskripsi': deskripsi,
    };
  }

  static InformasiInclude include() {
    return InformasiInclude._();
  }

  static InformasiIncludeList includeList({
    _i1.WhereExpressionBuilder<InformasiTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InformasiTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InformasiTable>? orderByList,
    InformasiInclude? include,
  }) {
    return InformasiIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Informasi.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Informasi.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InformasiImpl extends Informasi {
  _InformasiImpl({
    int? id,
    required String tujuan,
    required DateTime tanggalDibuat,
    required String judul,
    required String deskripsi,
  }) : super._(
          id: id,
          tujuan: tujuan,
          tanggalDibuat: tanggalDibuat,
          judul: judul,
          deskripsi: deskripsi,
        );

  @override
  Informasi copyWith({
    Object? id = _Undefined,
    String? tujuan,
    DateTime? tanggalDibuat,
    String? judul,
    String? deskripsi,
  }) {
    return Informasi(
      id: id is int? ? id : this.id,
      tujuan: tujuan ?? this.tujuan,
      tanggalDibuat: tanggalDibuat ?? this.tanggalDibuat,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }
}

class InformasiTable extends _i1.Table {
  InformasiTable({super.tableRelation}) : super(tableName: 'informasi') {
    tujuan = _i1.ColumnString(
      'tujuan',
      this,
    );
    tanggalDibuat = _i1.ColumnDateTime(
      'tanggalDibuat',
      this,
    );
    judul = _i1.ColumnString(
      'judul',
      this,
    );
    deskripsi = _i1.ColumnString(
      'deskripsi',
      this,
    );
  }

  late final _i1.ColumnString tujuan;

  late final _i1.ColumnDateTime tanggalDibuat;

  late final _i1.ColumnString judul;

  late final _i1.ColumnString deskripsi;

  @override
  List<_i1.Column> get columns => [
        id,
        tujuan,
        tanggalDibuat,
        judul,
        deskripsi,
      ];
}

class InformasiInclude extends _i1.IncludeObject {
  InformasiInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Informasi.t;
}

class InformasiIncludeList extends _i1.IncludeList {
  InformasiIncludeList._({
    _i1.WhereExpressionBuilder<InformasiTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Informasi.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Informasi.t;
}

class InformasiRepository {
  const InformasiRepository._();

  Future<List<Informasi>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InformasiTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InformasiTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InformasiTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Informasi>(
      where: where?.call(Informasi.t),
      orderBy: orderBy?.call(Informasi.t),
      orderByList: orderByList?.call(Informasi.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Informasi?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InformasiTable>? where,
    int? offset,
    _i1.OrderByBuilder<InformasiTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InformasiTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Informasi>(
      where: where?.call(Informasi.t),
      orderBy: orderBy?.call(Informasi.t),
      orderByList: orderByList?.call(Informasi.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Informasi?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Informasi>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Informasi>> insert(
    _i1.Session session,
    List<Informasi> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Informasi>(
      rows,
      transaction: transaction,
    );
  }

  Future<Informasi> insertRow(
    _i1.Session session,
    Informasi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Informasi>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Informasi>> update(
    _i1.Session session,
    List<Informasi> rows, {
    _i1.ColumnSelections<InformasiTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Informasi>(
      rows,
      columns: columns?.call(Informasi.t),
      transaction: transaction,
    );
  }

  Future<Informasi> updateRow(
    _i1.Session session,
    Informasi row, {
    _i1.ColumnSelections<InformasiTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Informasi>(
      row,
      columns: columns?.call(Informasi.t),
      transaction: transaction,
    );
  }

  Future<List<Informasi>> delete(
    _i1.Session session,
    List<Informasi> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Informasi>(
      rows,
      transaction: transaction,
    );
  }

  Future<Informasi> deleteRow(
    _i1.Session session,
    Informasi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Informasi>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Informasi>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InformasiTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Informasi>(
      where: where(Informasi.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InformasiTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Informasi>(
      where: where?.call(Informasi.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
