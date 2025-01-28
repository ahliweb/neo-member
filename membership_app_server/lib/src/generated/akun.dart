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

abstract class Akun implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = AkunTable();

  static const db = AkunRepository._();

  @override
  int? id;

  int relatedId;

  String username;

  String email;

  String role;

  String password;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'relatedId': relatedId,
      'username': username,
      'email': email,
      'role': role,
      'password': password,
    };
  }

  static AkunInclude include() {
    return AkunInclude._();
  }

  static AkunIncludeList includeList({
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AkunTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AkunTable>? orderByList,
    AkunInclude? include,
  }) {
    return AkunIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Akun.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Akun.t),
      include: include,
    );
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

class AkunTable extends _i1.Table {
  AkunTable({super.tableRelation}) : super(tableName: 'akun') {
    relatedId = _i1.ColumnInt(
      'relatedId',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
  }

  late final _i1.ColumnInt relatedId;

  late final _i1.ColumnString username;

  late final _i1.ColumnString email;

  late final _i1.ColumnString role;

  late final _i1.ColumnString password;

  @override
  List<_i1.Column> get columns => [
        id,
        relatedId,
        username,
        email,
        role,
        password,
      ];
}

class AkunInclude extends _i1.IncludeObject {
  AkunInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Akun.t;
}

class AkunIncludeList extends _i1.IncludeList {
  AkunIncludeList._({
    _i1.WhereExpressionBuilder<AkunTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Akun.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Akun.t;
}

class AkunRepository {
  const AkunRepository._();

  Future<List<Akun>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AkunTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AkunTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Akun>(
      where: where?.call(Akun.t),
      orderBy: orderBy?.call(Akun.t),
      orderByList: orderByList?.call(Akun.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Akun?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? offset,
    _i1.OrderByBuilder<AkunTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AkunTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Akun>(
      where: where?.call(Akun.t),
      orderBy: orderBy?.call(Akun.t),
      orderByList: orderByList?.call(Akun.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Akun?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Akun>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Akun>> insert(
    _i1.Session session,
    List<Akun> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Akun>(
      rows,
      transaction: transaction,
    );
  }

  Future<Akun> insertRow(
    _i1.Session session,
    Akun row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Akun>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Akun>> update(
    _i1.Session session,
    List<Akun> rows, {
    _i1.ColumnSelections<AkunTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Akun>(
      rows,
      columns: columns?.call(Akun.t),
      transaction: transaction,
    );
  }

  Future<Akun> updateRow(
    _i1.Session session,
    Akun row, {
    _i1.ColumnSelections<AkunTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Akun>(
      row,
      columns: columns?.call(Akun.t),
      transaction: transaction,
    );
  }

  Future<List<Akun>> delete(
    _i1.Session session,
    List<Akun> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Akun>(
      rows,
      transaction: transaction,
    );
  }

  Future<Akun> deleteRow(
    _i1.Session session,
    Akun row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Akun>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Akun>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AkunTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Akun>(
      where: where(Akun.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Akun>(
      where: where?.call(Akun.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
