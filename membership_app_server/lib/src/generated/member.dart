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

abstract class Member implements _i1.TableRow, _i1.ProtocolSerialization {
  Member._({
    this.id,
    required this.namaPelanggan,
    required this.noWhatsapp,
    required this.nik,
    required this.alamatKtp,
    required this.kelurahan,
    required this.kecamatan,
    required this.kabupaten,
    required this.provinsi,
    required this.status,
    this.ktp,
    required this.tanggalDibuat,
    this.alamatDomisili,
    this.kelurahanDomisili,
    this.kecamatanDomisili,
    this.kabupatenDomisili,
    this.provinsiDomisili,
  });

  factory Member({
    int? id,
    required String namaPelanggan,
    required String noWhatsapp,
    required int nik,
    required String alamatKtp,
    required String kelurahan,
    required String kecamatan,
    required String kabupaten,
    required String provinsi,
    required String status,
    String? ktp,
    required DateTime tanggalDibuat,
    String? alamatDomisili,
    String? kelurahanDomisili,
    String? kecamatanDomisili,
    String? kabupatenDomisili,
    String? provinsiDomisili,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      namaPelanggan: jsonSerialization['namaPelanggan'] as String,
      noWhatsapp: jsonSerialization['noWhatsapp'] as String,
      nik: jsonSerialization['nik'] as int,
      alamatKtp: jsonSerialization['alamatKtp'] as String,
      kelurahan: jsonSerialization['kelurahan'] as String,
      kecamatan: jsonSerialization['kecamatan'] as String,
      kabupaten: jsonSerialization['kabupaten'] as String,
      provinsi: jsonSerialization['provinsi'] as String,
      status: jsonSerialization['status'] as String,
      ktp: jsonSerialization['ktp'] as String?,
      tanggalDibuat: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['tanggalDibuat']),
      alamatDomisili: jsonSerialization['alamatDomisili'] as String?,
      kelurahanDomisili: jsonSerialization['kelurahanDomisili'] as String?,
      kecamatanDomisili: jsonSerialization['kecamatanDomisili'] as String?,
      kabupatenDomisili: jsonSerialization['kabupatenDomisili'] as String?,
      provinsiDomisili: jsonSerialization['provinsiDomisili'] as String?,
    );
  }

  static final t = MemberTable();

  static const db = MemberRepository._();

  @override
  int? id;

  String namaPelanggan;

  String noWhatsapp;

  int nik;

  String alamatKtp;

  String kelurahan;

  String kecamatan;

  String kabupaten;

  String provinsi;

  String status;

  String? ktp;

  DateTime tanggalDibuat;

  String? alamatDomisili;

  String? kelurahanDomisili;

  String? kecamatanDomisili;

  String? kabupatenDomisili;

  String? provinsiDomisili;

  int? _salesPelangganSalesId;

  @override
  _i1.Table get table => t;

  Member copyWith({
    int? id,
    String? namaPelanggan,
    String? noWhatsapp,
    int? nik,
    String? alamatKtp,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    String? status,
    String? ktp,
    DateTime? tanggalDibuat,
    String? alamatDomisili,
    String? kelurahanDomisili,
    String? kecamatanDomisili,
    String? kabupatenDomisili,
    String? provinsiDomisili,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'namaPelanggan': namaPelanggan,
      'noWhatsapp': noWhatsapp,
      'nik': nik,
      'alamatKtp': alamatKtp,
      'kelurahan': kelurahan,
      'kecamatan': kecamatan,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'status': status,
      if (ktp != null) 'ktp': ktp,
      'tanggalDibuat': tanggalDibuat.toJson(),
      if (alamatDomisili != null) 'alamatDomisili': alamatDomisili,
      if (kelurahanDomisili != null) 'kelurahanDomisili': kelurahanDomisili,
      if (kecamatanDomisili != null) 'kecamatanDomisili': kecamatanDomisili,
      if (kabupatenDomisili != null) 'kabupatenDomisili': kabupatenDomisili,
      if (provinsiDomisili != null) 'provinsiDomisili': provinsiDomisili,
      if (_salesPelangganSalesId != null)
        '_salesPelangganSalesId': _salesPelangganSalesId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'namaPelanggan': namaPelanggan,
      'noWhatsapp': noWhatsapp,
      'nik': nik,
      'alamatKtp': alamatKtp,
      'kelurahan': kelurahan,
      'kecamatan': kecamatan,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'status': status,
      if (ktp != null) 'ktp': ktp,
      'tanggalDibuat': tanggalDibuat.toJson(),
      if (alamatDomisili != null) 'alamatDomisili': alamatDomisili,
      if (kelurahanDomisili != null) 'kelurahanDomisili': kelurahanDomisili,
      if (kecamatanDomisili != null) 'kecamatanDomisili': kecamatanDomisili,
      if (kabupatenDomisili != null) 'kabupatenDomisili': kabupatenDomisili,
      if (provinsiDomisili != null) 'provinsiDomisili': provinsiDomisili,
    };
  }

  static MemberInclude include() {
    return MemberInclude._();
  }

  static MemberIncludeList includeList({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    MemberInclude? include,
  }) {
    return MemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Member.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    int? id,
    required String namaPelanggan,
    required String noWhatsapp,
    required int nik,
    required String alamatKtp,
    required String kelurahan,
    required String kecamatan,
    required String kabupaten,
    required String provinsi,
    required String status,
    String? ktp,
    required DateTime tanggalDibuat,
    String? alamatDomisili,
    String? kelurahanDomisili,
    String? kecamatanDomisili,
    String? kabupatenDomisili,
    String? provinsiDomisili,
  }) : super._(
          id: id,
          namaPelanggan: namaPelanggan,
          noWhatsapp: noWhatsapp,
          nik: nik,
          alamatKtp: alamatKtp,
          kelurahan: kelurahan,
          kecamatan: kecamatan,
          kabupaten: kabupaten,
          provinsi: provinsi,
          status: status,
          ktp: ktp,
          tanggalDibuat: tanggalDibuat,
          alamatDomisili: alamatDomisili,
          kelurahanDomisili: kelurahanDomisili,
          kecamatanDomisili: kecamatanDomisili,
          kabupatenDomisili: kabupatenDomisili,
          provinsiDomisili: provinsiDomisili,
        );

  @override
  Member copyWith({
    Object? id = _Undefined,
    String? namaPelanggan,
    String? noWhatsapp,
    int? nik,
    String? alamatKtp,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    String? status,
    Object? ktp = _Undefined,
    DateTime? tanggalDibuat,
    Object? alamatDomisili = _Undefined,
    Object? kelurahanDomisili = _Undefined,
    Object? kecamatanDomisili = _Undefined,
    Object? kabupatenDomisili = _Undefined,
    Object? provinsiDomisili = _Undefined,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      namaPelanggan: namaPelanggan ?? this.namaPelanggan,
      noWhatsapp: noWhatsapp ?? this.noWhatsapp,
      nik: nik ?? this.nik,
      alamatKtp: alamatKtp ?? this.alamatKtp,
      kelurahan: kelurahan ?? this.kelurahan,
      kecamatan: kecamatan ?? this.kecamatan,
      kabupaten: kabupaten ?? this.kabupaten,
      provinsi: provinsi ?? this.provinsi,
      status: status ?? this.status,
      ktp: ktp is String? ? ktp : this.ktp,
      tanggalDibuat: tanggalDibuat ?? this.tanggalDibuat,
      alamatDomisili:
          alamatDomisili is String? ? alamatDomisili : this.alamatDomisili,
      kelurahanDomisili: kelurahanDomisili is String?
          ? kelurahanDomisili
          : this.kelurahanDomisili,
      kecamatanDomisili: kecamatanDomisili is String?
          ? kecamatanDomisili
          : this.kecamatanDomisili,
      kabupatenDomisili: kabupatenDomisili is String?
          ? kabupatenDomisili
          : this.kabupatenDomisili,
      provinsiDomisili: provinsiDomisili is String?
          ? provinsiDomisili
          : this.provinsiDomisili,
    );
  }
}

class MemberImplicit extends _MemberImpl {
  MemberImplicit._({
    int? id,
    required String namaPelanggan,
    required String noWhatsapp,
    required int nik,
    required String alamatKtp,
    required String kelurahan,
    required String kecamatan,
    required String kabupaten,
    required String provinsi,
    required String status,
    String? ktp,
    required DateTime tanggalDibuat,
    String? alamatDomisili,
    String? kelurahanDomisili,
    String? kecamatanDomisili,
    String? kabupatenDomisili,
    String? provinsiDomisili,
    this.$_salesPelangganSalesId,
  }) : super(
          id: id,
          namaPelanggan: namaPelanggan,
          noWhatsapp: noWhatsapp,
          nik: nik,
          alamatKtp: alamatKtp,
          kelurahan: kelurahan,
          kecamatan: kecamatan,
          kabupaten: kabupaten,
          provinsi: provinsi,
          status: status,
          ktp: ktp,
          tanggalDibuat: tanggalDibuat,
          alamatDomisili: alamatDomisili,
          kelurahanDomisili: kelurahanDomisili,
          kecamatanDomisili: kecamatanDomisili,
          kabupatenDomisili: kabupatenDomisili,
          provinsiDomisili: provinsiDomisili,
        );

  factory MemberImplicit(
    Member member, {
    int? $_salesPelangganSalesId,
  }) {
    return MemberImplicit._(
      id: member.id,
      namaPelanggan: member.namaPelanggan,
      noWhatsapp: member.noWhatsapp,
      nik: member.nik,
      alamatKtp: member.alamatKtp,
      kelurahan: member.kelurahan,
      kecamatan: member.kecamatan,
      kabupaten: member.kabupaten,
      provinsi: member.provinsi,
      status: member.status,
      ktp: member.ktp,
      tanggalDibuat: member.tanggalDibuat,
      alamatDomisili: member.alamatDomisili,
      kelurahanDomisili: member.kelurahanDomisili,
      kecamatanDomisili: member.kecamatanDomisili,
      kabupatenDomisili: member.kabupatenDomisili,
      provinsiDomisili: member.provinsiDomisili,
      $_salesPelangganSalesId: $_salesPelangganSalesId,
    );
  }

  int? $_salesPelangganSalesId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_salesPelangganSalesId': $_salesPelangganSalesId});
    return jsonMap;
  }
}

class MemberTable extends _i1.Table {
  MemberTable({super.tableRelation}) : super(tableName: 'member') {
    namaPelanggan = _i1.ColumnString(
      'namaPelanggan',
      this,
    );
    noWhatsapp = _i1.ColumnString(
      'noWhatsapp',
      this,
    );
    nik = _i1.ColumnInt(
      'nik',
      this,
    );
    alamatKtp = _i1.ColumnString(
      'alamatKtp',
      this,
    );
    kelurahan = _i1.ColumnString(
      'kelurahan',
      this,
    );
    kecamatan = _i1.ColumnString(
      'kecamatan',
      this,
    );
    kabupaten = _i1.ColumnString(
      'kabupaten',
      this,
    );
    provinsi = _i1.ColumnString(
      'provinsi',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    ktp = _i1.ColumnString(
      'ktp',
      this,
    );
    tanggalDibuat = _i1.ColumnDateTime(
      'tanggalDibuat',
      this,
    );
    alamatDomisili = _i1.ColumnString(
      'alamatDomisili',
      this,
    );
    kelurahanDomisili = _i1.ColumnString(
      'kelurahanDomisili',
      this,
    );
    kecamatanDomisili = _i1.ColumnString(
      'kecamatanDomisili',
      this,
    );
    kabupatenDomisili = _i1.ColumnString(
      'kabupatenDomisili',
      this,
    );
    provinsiDomisili = _i1.ColumnString(
      'provinsiDomisili',
      this,
    );
    $_salesPelangganSalesId = _i1.ColumnInt(
      '_salesPelangganSalesId',
      this,
    );
  }

  late final _i1.ColumnString namaPelanggan;

  late final _i1.ColumnString noWhatsapp;

  late final _i1.ColumnInt nik;

  late final _i1.ColumnString alamatKtp;

  late final _i1.ColumnString kelurahan;

  late final _i1.ColumnString kecamatan;

  late final _i1.ColumnString kabupaten;

  late final _i1.ColumnString provinsi;

  late final _i1.ColumnString status;

  late final _i1.ColumnString ktp;

  late final _i1.ColumnDateTime tanggalDibuat;

  late final _i1.ColumnString alamatDomisili;

  late final _i1.ColumnString kelurahanDomisili;

  late final _i1.ColumnString kecamatanDomisili;

  late final _i1.ColumnString kabupatenDomisili;

  late final _i1.ColumnString provinsiDomisili;

  late final _i1.ColumnInt $_salesPelangganSalesId;

  @override
  List<_i1.Column> get columns => [
        id,
        namaPelanggan,
        noWhatsapp,
        nik,
        alamatKtp,
        kelurahan,
        kecamatan,
        kabupaten,
        provinsi,
        status,
        ktp,
        tanggalDibuat,
        alamatDomisili,
        kelurahanDomisili,
        kecamatanDomisili,
        kabupatenDomisili,
        provinsiDomisili,
        $_salesPelangganSalesId,
      ];
}

class MemberInclude extends _i1.IncludeObject {
  MemberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Member.t;
}

class MemberIncludeList extends _i1.IncludeList {
  MemberIncludeList._({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Member.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Member.t;
}

class MemberRepository {
  const MemberRepository._();

  Future<List<Member>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Member?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Member?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Member>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Member>> insert(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Member>(
      rows,
      transaction: transaction,
    );
  }

  Future<Member> insertRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Member>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Member>> update(
    _i1.Session session,
    List<Member> rows, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Member>(
      rows,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  Future<Member> updateRow(
    _i1.Session session,
    Member row, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Member>(
      row,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  Future<List<Member>> delete(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Member>(
      rows,
      transaction: transaction,
    );
  }

  Future<Member> deleteRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Member>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Member>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Member>(
      where: where(Member.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Member>(
      where: where?.call(Member.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
