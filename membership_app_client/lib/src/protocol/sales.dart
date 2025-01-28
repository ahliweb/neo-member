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

abstract class Sales implements _i1.SerializableModel {
  Sales._({
    this.id,
    required this.namaSales,
    required this.nik,
    this.pelanggan,
    required this.noWhatsapp,
  });

  factory Sales({
    int? id,
    required String namaSales,
    required String nik,
    List<_i2.Member>? pelanggan,
    required String noWhatsapp,
  }) = _SalesImpl;

  factory Sales.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sales(
      id: jsonSerialization['id'] as int?,
      namaSales: jsonSerialization['namaSales'] as String,
      nik: jsonSerialization['nik'] as String,
      pelanggan: (jsonSerialization['pelanggan'] as List?)
          ?.map((e) => _i2.Member.fromJson((e as Map<String, dynamic>)))
          .toList(),
      noWhatsapp: jsonSerialization['noWhatsapp'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String namaSales;

  String nik;

  List<_i2.Member>? pelanggan;

  String noWhatsapp;

  Sales copyWith({
    int? id,
    String? namaSales,
    String? nik,
    List<_i2.Member>? pelanggan,
    String? noWhatsapp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'namaSales': namaSales,
      'nik': nik,
      if (pelanggan != null)
        'pelanggan': pelanggan?.toJson(valueToJson: (v) => v.toJson()),
      'noWhatsapp': noWhatsapp,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesImpl extends Sales {
  _SalesImpl({
    int? id,
    required String namaSales,
    required String nik,
    List<_i2.Member>? pelanggan,
    required String noWhatsapp,
  }) : super._(
          id: id,
          namaSales: namaSales,
          nik: nik,
          pelanggan: pelanggan,
          noWhatsapp: noWhatsapp,
        );

  @override
  Sales copyWith({
    Object? id = _Undefined,
    String? namaSales,
    String? nik,
    Object? pelanggan = _Undefined,
    String? noWhatsapp,
  }) {
    return Sales(
      id: id is int? ? id : this.id,
      namaSales: namaSales ?? this.namaSales,
      nik: nik ?? this.nik,
      pelanggan: pelanggan is List<_i2.Member>?
          ? pelanggan
          : this.pelanggan?.map((e0) => e0.copyWith()).toList(),
      noWhatsapp: noWhatsapp ?? this.noWhatsapp,
    );
  }
}
