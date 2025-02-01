/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Member implements _i1.SerializableModel {
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
    this.salesPelangganSalesId,
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
    int? salesPelangganSalesId,
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
      salesPelangganSalesId: jsonSerialization['salesPelangganSalesId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  int? salesPelangganSalesId;

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
    int? salesPelangganSalesId,
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
      if (salesPelangganSalesId != null)
        'salesPelangganSalesId': salesPelangganSalesId,
    };
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
    int? salesPelangganSalesId,
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
          salesPelangganSalesId: salesPelangganSalesId,
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
    Object? salesPelangganSalesId = _Undefined,
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
      salesPelangganSalesId: salesPelangganSalesId is int?
          ? salesPelangganSalesId
          : this.salesPelangganSalesId,
    );
  }
}
