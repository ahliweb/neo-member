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
import 'member.dart' as _i2;

abstract class DatabaseMember implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<String>? buktiPembayaran;

  int idPembayaran;

  _i2.Member? nikPelanggan;

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
