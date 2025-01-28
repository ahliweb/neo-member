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
import 'dart:async' as _i2;
import 'package:membership_app_client/src/protocol/database_member.dart' as _i3;
import 'package:membership_app_client/src/protocol/informasi.dart' as _i4;
import 'package:membership_app_client/src/protocol/member.dart' as _i5;
import 'package:membership_app_client/src/protocol/sales.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointDatabaseMember extends _i1.EndpointRef {
  EndpointDatabaseMember(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'databaseMember';

  _i2.Future<List<_i3.DatabaseMember>> getAllDatabaseMembers() =>
      caller.callServerEndpoint<List<_i3.DatabaseMember>>(
        'databaseMember',
        'getAllDatabaseMembers',
        {},
      );

  _i2.Future<_i3.DatabaseMember?> getDatabaseMemberById(int id) =>
      caller.callServerEndpoint<_i3.DatabaseMember?>(
        'databaseMember',
        'getDatabaseMemberById',
        {'id': id},
      );

  _i2.Future<bool> addDatabaseMember(_i3.DatabaseMember databaseMember) =>
      caller.callServerEndpoint<bool>(
        'databaseMember',
        'addDatabaseMember',
        {'databaseMember': databaseMember},
      );

  _i2.Future<bool> updateDatabaseMember(_i3.DatabaseMember databaseMember) =>
      caller.callServerEndpoint<bool>(
        'databaseMember',
        'updateDatabaseMember',
        {'databaseMember': databaseMember},
      );

  _i2.Future<bool> deleteDatabaseMember(int id) =>
      caller.callServerEndpoint<bool>(
        'databaseMember',
        'deleteDatabaseMember',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointInformasi extends _i1.EndpointRef {
  EndpointInformasi(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'informasi';

  _i2.Future<List<_i4.Informasi>> getAllInformasi() =>
      caller.callServerEndpoint<List<_i4.Informasi>>(
        'informasi',
        'getAllInformasi',
        {},
      );

  _i2.Future<_i4.Informasi?> getInformasiById(int id) =>
      caller.callServerEndpoint<_i4.Informasi?>(
        'informasi',
        'getInformasiById',
        {'id': id},
      );

  _i2.Future<_i4.Informasi> addInformasi(_i4.Informasi informasi) =>
      caller.callServerEndpoint<_i4.Informasi>(
        'informasi',
        'addInformasi',
        {'informasi': informasi},
      );

  _i2.Future<_i4.Informasi> updateInformasi(_i4.Informasi informasi) =>
      caller.callServerEndpoint<_i4.Informasi>(
        'informasi',
        'updateInformasi',
        {'informasi': informasi},
      );

  _i2.Future<bool> deleteInformasi({required int id}) =>
      caller.callServerEndpoint<bool>(
        'informasi',
        'deleteInformasi',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMember extends _i1.EndpointRef {
  EndpointMember(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  _i2.Future<List<_i5.Member>> getAllMembers() =>
      caller.callServerEndpoint<List<_i5.Member>>(
        'member',
        'getAllMembers',
        {},
      );

  _i2.Future<_i5.Member?> getMemberById(int id) =>
      caller.callServerEndpoint<_i5.Member?>(
        'member',
        'getMemberById',
        {'id': id},
      );

  _i2.Future<bool> addMember(_i5.Member member) =>
      caller.callServerEndpoint<bool>(
        'member',
        'addMember',
        {'member': member},
      );

  _i2.Future<bool> updateMember(_i5.Member member) =>
      caller.callServerEndpoint<bool>(
        'member',
        'updateMember',
        {'member': member},
      );

  _i2.Future<bool> deleteMember(int id) => caller.callServerEndpoint<bool>(
        'member',
        'deleteMember',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointSales extends _i1.EndpointRef {
  EndpointSales(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sales';

  _i2.Future<List<_i6.Sales>> getAllSales() =>
      caller.callServerEndpoint<List<_i6.Sales>>(
        'sales',
        'getAllSales',
        {},
      );

  _i2.Future<_i6.Sales?> getSalesById(int id) =>
      caller.callServerEndpoint<_i6.Sales?>(
        'sales',
        'getSalesById',
        {'id': id},
      );

  _i2.Future<bool> addSales(_i6.Sales sales) => caller.callServerEndpoint<bool>(
        'sales',
        'addSales',
        {'sales': sales},
      );

  _i2.Future<bool> updateSales(_i6.Sales sales) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'updateSales',
        {'sales': sales},
      );

  _i2.Future<bool> deleteSales(int id) => caller.callServerEndpoint<bool>(
        'sales',
        'deleteSales',
        {'id': id},
      );

  _i2.Future<List<_i5.Member>> getSalesMembers(int salesId) =>
      caller.callServerEndpoint<List<_i5.Member>>(
        'sales',
        'getSalesMembers',
        {'salesId': salesId},
      );

  _i2.Future<bool> addMemberToSales(
    int salesId,
    _i5.Member member,
  ) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'addMemberToSales',
        {
          'salesId': salesId,
          'member': member,
        },
      );

  _i2.Future<bool> removeMemberFromSales(
    int salesId,
    int memberId,
  ) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'removeMemberFromSales',
        {
          'salesId': salesId,
          'memberId': memberId,
        },
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    databaseMember = EndpointDatabaseMember(this);
    example = EndpointExample(this);
    informasi = EndpointInformasi(this);
    member = EndpointMember(this);
    sales = EndpointSales(this);
  }

  late final EndpointDatabaseMember databaseMember;

  late final EndpointExample example;

  late final EndpointInformasi informasi;

  late final EndpointMember member;

  late final EndpointSales sales;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'databaseMember': databaseMember,
        'example': example,
        'informasi': informasi,
        'member': member,
        'sales': sales,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
