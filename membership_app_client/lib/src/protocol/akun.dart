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

abstract class Akun implements _i1.SerializableModel {
  Akun._({
    this.id,
    required this.relatedId,
    required this.username,
    required this.email,
    required this.role,
    required this.password,
  });

  factory Akun({
    int? id,
    required int relatedId,
    required String username,
    required String email,
    required String role,
    required String password,
  }) = _AkunImpl;

  factory Akun.fromJson(Map<String, dynamic> jsonSerialization) {
    return Akun(
      id: jsonSerialization['id'] as int?,
      relatedId: jsonSerialization['relatedId'] as int,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int relatedId;

  String username;

  String email;

  String role;

  String password;

  Akun copyWith({
    int? id,
    int? relatedId,
    String? username,
    String? email,
    String? role,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'relatedId': relatedId,
      'username': username,
      'email': email,
      'role': role,
      'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AkunImpl extends Akun {
  _AkunImpl({
    int? id,
    required int relatedId,
    required String username,
    required String email,
    required String role,
    required String password,
  }) : super._(
          id: id,
          relatedId: relatedId,
          username: username,
          email: email,
          role: role,
          password: password,
        );

  @override
  Akun copyWith({
    Object? id = _Undefined,
    int? relatedId,
    String? username,
    String? email,
    String? role,
    String? password,
  }) {
    return Akun(
      id: id is int? ? id : this.id,
      relatedId: relatedId ?? this.relatedId,
      username: username ?? this.username,
      email: email ?? this.email,
      role: role ?? this.role,
      password: password ?? this.password,
    );
  }
}
