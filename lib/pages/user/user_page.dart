import 'package:flutter/material.dart';
import 'package:music_app_admin/api/user_api.dart';
import 'package:music_app_admin/model/user_vo.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder(
            future: list(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If we got an error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final List<UserVo> userVos = snapshot.data as List<UserVo>;
                  return PaginatedDataTable(
                    rowsPerPage: 10,
                    header: const Text("用户列表"),
                    columns: const [
                      DataColumn(label: Text('主键')),
                      DataColumn(label: Text('用户名')),
                      DataColumn(label: Text('昵称')),
                    ],
                    source: UserDataSource(userVos: userVos),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

class UserDataSource extends DataTableSource {
  final int _selectedCount = 0;

  final List<UserVo> userVos;

  UserDataSource({required this.userVos});

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= userVos.length) return null;
    final UserVo userVo = userVos[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${userVo.id}')),
      DataCell(Text('${userVo.username}')),
      DataCell(Text('${userVo.nickname}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => userVos.length;

  @override
  int get selectedRowCount => _selectedCount;
}
