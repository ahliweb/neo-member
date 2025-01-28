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

abstract class Broadcast implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String pesan;

  int tujuan;

  DateTime tanggalDibuat;

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
