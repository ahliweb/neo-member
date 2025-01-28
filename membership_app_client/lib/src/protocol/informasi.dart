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

abstract class Informasi implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tujuan;

  DateTime tanggalDibuat;

  String judul;

  String deskripsi;

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
