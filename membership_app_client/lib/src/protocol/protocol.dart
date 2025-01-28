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
import 'akun.dart' as _i2;
import 'broadcast.dart' as _i3;
import 'database_member.dart' as _i4;
import 'example.dart' as _i5;
import 'informasi.dart' as _i6;
import 'member.dart' as _i7;
import 'sales.dart' as _i8;
import 'package:membership_app_client/src/protocol/database_member.dart' as _i9;
import 'package:membership_app_client/src/protocol/informasi.dart' as _i10;
import 'package:membership_app_client/src/protocol/member.dart' as _i11;
import 'package:membership_app_client/src/protocol/sales.dart' as _i12;
export 'akun.dart';
export 'broadcast.dart';
export 'database_member.dart';
export 'example.dart';
export 'informasi.dart';
export 'member.dart';
export 'sales.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Akun) {
      return _i2.Akun.fromJson(data) as T;
    }
    if (t == _i3.Broadcast) {
      return _i3.Broadcast.fromJson(data) as T;
    }
    if (t == _i4.DatabaseMember) {
      return _i4.DatabaseMember.fromJson(data) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.Informasi) {
      return _i6.Informasi.fromJson(data) as T;
    }
    if (t == _i7.Member) {
      return _i7.Member.fromJson(data) as T;
    }
    if (t == _i8.Sales) {
      return _i8.Sales.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Akun?>()) {
      return (data != null ? _i2.Akun.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Broadcast?>()) {
      return (data != null ? _i3.Broadcast.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DatabaseMember?>()) {
      return (data != null ? _i4.DatabaseMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Informasi?>()) {
      return (data != null ? _i6.Informasi.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Member?>()) {
      return (data != null ? _i7.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Sales?>()) {
      return (data != null ? _i8.Sales.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i7.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Member>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i9.DatabaseMember>) {
      return (data as List)
          .map((e) => deserialize<_i9.DatabaseMember>(e))
          .toList() as dynamic;
    }
    if (t == List<_i10.Informasi>) {
      return (data as List).map((e) => deserialize<_i10.Informasi>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.Member>) {
      return (data as List).map((e) => deserialize<_i11.Member>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Sales>) {
      return (data as List).map((e) => deserialize<_i12.Sales>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Akun) {
      return 'Akun';
    }
    if (data is _i3.Broadcast) {
      return 'Broadcast';
    }
    if (data is _i4.DatabaseMember) {
      return 'DatabaseMember';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.Informasi) {
      return 'Informasi';
    }
    if (data is _i7.Member) {
      return 'Member';
    }
    if (data is _i8.Sales) {
      return 'Sales';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Akun') {
      return deserialize<_i2.Akun>(data['data']);
    }
    if (dataClassName == 'Broadcast') {
      return deserialize<_i3.Broadcast>(data['data']);
    }
    if (dataClassName == 'DatabaseMember') {
      return deserialize<_i4.DatabaseMember>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (dataClassName == 'Informasi') {
      return deserialize<_i6.Informasi>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i7.Member>(data['data']);
    }
    if (dataClassName == 'Sales') {
      return deserialize<_i8.Sales>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
