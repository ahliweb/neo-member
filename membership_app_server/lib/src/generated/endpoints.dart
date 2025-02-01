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
import '../endpoints/dashboard_endpoint.dart' as _i2;
import '../endpoints/database_member_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/informasi_endpoint.dart' as _i5;
import '../endpoints/member_endpoint.dart' as _i6;
import '../endpoints/sales_endpoint.dart' as _i7;
import 'package:membership_app_server/src/generated/database_member.dart'
    as _i8;
import 'package:membership_app_server/src/generated/informasi.dart' as _i9;
import 'package:membership_app_server/src/generated/member.dart' as _i10;
import 'package:membership_app_server/src/generated/sales.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'dashboard': _i2.DashboardEndpoint()
        ..initialize(
          server,
          'dashboard',
          null,
        ),
      'databaseMember': _i3.DatabaseMemberEndpoint()
        ..initialize(
          server,
          'databaseMember',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'informasi': _i5.InformasiEndpoint()
        ..initialize(
          server,
          'informasi',
          null,
        ),
      'member': _i6.MemberEndpoint()
        ..initialize(
          server,
          'member',
          null,
        ),
      'sales': _i7.SalesEndpoint()
        ..initialize(
          server,
          'sales',
          null,
        ),
    };
    connectors['dashboard'] = _i1.EndpointConnector(
      name: 'dashboard',
      endpoint: endpoints['dashboard']!,
      methodConnectors: {
        'getTotalMembers': _i1.MethodConnector(
          name: 'getTotalMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i2.DashboardEndpoint)
                  .getTotalMembers(session),
        ),
        'getValidMembers': _i1.MethodConnector(
          name: 'getValidMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i2.DashboardEndpoint)
                  .getValidMembers(session),
        ),
        'getSalesCount': _i1.MethodConnector(
          name: 'getSalesCount',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i2.DashboardEndpoint)
                  .getSalesCount(session),
        ),
        'getMemberChartData': _i1.MethodConnector(
          name: 'getMemberChartData',
          params: {
            'mode': _i1.ParameterDescription(
              name: 'mode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'period': _i1.ParameterDescription(
              name: 'period',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i2.DashboardEndpoint)
                  .getMemberChartData(
            session,
            mode: params['mode'],
            period: params['period'],
          ),
        ),
      },
    );
    connectors['databaseMember'] = _i1.EndpointConnector(
      name: 'databaseMember',
      endpoint: endpoints['databaseMember']!,
      methodConnectors: {
        'getAllDatabaseMembers': _i1.MethodConnector(
          name: 'getAllDatabaseMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i3.DatabaseMemberEndpoint)
                  .getAllDatabaseMembers(session),
        ),
        'getDatabaseMemberById': _i1.MethodConnector(
          name: 'getDatabaseMemberById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i3.DatabaseMemberEndpoint)
                  .getDatabaseMemberById(
            session,
            params['id'],
          ),
        ),
        'getDatabaseMemberByPelangganId': _i1.MethodConnector(
          name: 'getDatabaseMemberByPelangganId',
          params: {
            'pelangganId': _i1.ParameterDescription(
              name: 'pelangganId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i3.DatabaseMemberEndpoint)
                  .getDatabaseMemberByPelangganId(
            session,
            params['pelangganId'],
          ),
        ),
        'addDatabaseMember': _i1.MethodConnector(
          name: 'addDatabaseMember',
          params: {
            'databaseMember': _i1.ParameterDescription(
              name: 'databaseMember',
              type: _i1.getType<_i8.DatabaseMember>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i3.DatabaseMemberEndpoint)
                  .addDatabaseMember(
            session,
            params['databaseMember'],
          ),
        ),
        'updateDatabaseMember': _i1.MethodConnector(
          name: 'updateDatabaseMember',
          params: {
            'databaseMember': _i1.ParameterDescription(
              name: 'databaseMember',
              type: _i1.getType<_i8.DatabaseMember>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i3.DatabaseMemberEndpoint)
                  .updateDatabaseMember(
            session,
            params['databaseMember'],
          ),
        ),
        'deleteDatabaseMember': _i1.MethodConnector(
          name: 'deleteDatabaseMember',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i3.DatabaseMemberEndpoint)
                  .deleteDatabaseMember(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['informasi'] = _i1.EndpointConnector(
      name: 'informasi',
      endpoint: endpoints['informasi']!,
      methodConnectors: {
        'getAllInformasi': _i1.MethodConnector(
          name: 'getAllInformasi',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i5.InformasiEndpoint)
                  .getAllInformasi(session),
        ),
        'getInformasiById': _i1.MethodConnector(
          name: 'getInformasiById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i5.InformasiEndpoint)
                  .getInformasiById(
            session,
            params['id'],
          ),
        ),
        'addInformasi': _i1.MethodConnector(
          name: 'addInformasi',
          params: {
            'informasi': _i1.ParameterDescription(
              name: 'informasi',
              type: _i1.getType<_i9.Informasi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i5.InformasiEndpoint).addInformasi(
            session,
            params['informasi'],
          ),
        ),
        'updateInformasi': _i1.MethodConnector(
          name: 'updateInformasi',
          params: {
            'informasi': _i1.ParameterDescription(
              name: 'informasi',
              type: _i1.getType<_i9.Informasi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i5.InformasiEndpoint).updateInformasi(
            session,
            params['informasi'],
          ),
        ),
        'deleteInformasi': _i1.MethodConnector(
          name: 'deleteInformasi',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i5.InformasiEndpoint).deleteInformasi(
            session,
            id: params['id'],
          ),
        ),
      },
    );
    connectors['member'] = _i1.EndpointConnector(
      name: 'member',
      endpoint: endpoints['member']!,
      methodConnectors: {
        'getAllMembers': _i1.MethodConnector(
          name: 'getAllMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i6.MemberEndpoint)
                  .getAllMembers(session),
        ),
        'getMemberById': _i1.MethodConnector(
          name: 'getMemberById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i6.MemberEndpoint).getMemberById(
            session,
            params['id'],
          ),
        ),
        'addMember': _i1.MethodConnector(
          name: 'addMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i10.Member>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i6.MemberEndpoint).addMember(
            session,
            params['member'],
          ),
        ),
        'updateMember': _i1.MethodConnector(
          name: 'updateMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i10.Member>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i6.MemberEndpoint).updateMember(
            session,
            params['member'],
          ),
        ),
        'deleteMember': _i1.MethodConnector(
          name: 'deleteMember',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i6.MemberEndpoint).deleteMember(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['sales'] = _i1.EndpointConnector(
      name: 'sales',
      endpoint: endpoints['sales']!,
      methodConnectors: {
        'getAllSales': _i1.MethodConnector(
          name: 'getAllSales',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).getAllSales(session),
        ),
        'getSalesById': _i1.MethodConnector(
          name: 'getSalesById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).getSalesById(
            session,
            params['id'],
          ),
        ),
        'addSales': _i1.MethodConnector(
          name: 'addSales',
          params: {
            'sales': _i1.ParameterDescription(
              name: 'sales',
              type: _i1.getType<_i11.Sales>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).addSales(
            session,
            params['sales'],
          ),
        ),
        'updateSales': _i1.MethodConnector(
          name: 'updateSales',
          params: {
            'sales': _i1.ParameterDescription(
              name: 'sales',
              type: _i1.getType<_i11.Sales>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).updateSales(
            session,
            params['sales'],
          ),
        ),
        'deleteSales': _i1.MethodConnector(
          name: 'deleteSales',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).deleteSales(
            session,
            params['id'],
          ),
        ),
        'getSalesMembers': _i1.MethodConnector(
          name: 'getSalesMembers',
          params: {
            'salesId': _i1.ParameterDescription(
              name: 'salesId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).getSalesMembers(
            session,
            params['salesId'],
          ),
        ),
        'addMemberToSales': _i1.MethodConnector(
          name: 'addMemberToSales',
          params: {
            'salesId': _i1.ParameterDescription(
              name: 'salesId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i10.Member>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).addMemberToSales(
            session,
            params['salesId'],
            params['member'],
          ),
        ),
        'removeMemberFromSales': _i1.MethodConnector(
          name: 'removeMemberFromSales',
          params: {
            'salesId': _i1.ParameterDescription(
              name: 'salesId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'memberId': _i1.ParameterDescription(
              name: 'memberId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).removeMemberFromSales(
            session,
            params['salesId'],
            params['memberId'],
          ),
        ),
      },
    );
  }
}
