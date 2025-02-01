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

abstract class DatabaseMember implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String buktiPembayaran;

  String keterangan;

  int pelangganId;

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
