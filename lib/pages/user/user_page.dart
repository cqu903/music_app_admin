import 'package:flutter/material.dart';
import 'package:music_app_admin/api/user_api.dart';
import 'package:music_app_admin/model/page.dart' as page;
import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/utils/log_util.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserVo> users = [];

  @override
  void initState() {
    super.initState();
    var now = DateTime.now().millisecondsSinceEpoch;
    logger().info(now);
    search(page.Page(page: 0, size: 10)).then((value) => setState(() {
          users = value;
          print(DateTime.now().millisecondsSinceEpoch - now);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columns: const [
        DataColumn(label: Text("id")),
        DataColumn(label: Text("用户名")),
      ],
      rows: users
          .map((userVo) => DataRow(cells: [
                DataCell(Text(userVo.id ?? '缺失')),
                DataCell(Text(userVo.username ?? '缺失')),
              ]))
          .toList(),
      source: null,
    );
  }
}

class UserDataSource extends DataTableSource {
  final List<UserVo> data;

  UserDataSource(this.data);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].id}')),
        DataCell(Text('${data[index].username}')),
        DataCell(Text('${data[index].nickname}')),
        DataCell(Text(data[index].gender ?? 'n/a')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => throw UnimplementedError();

  @override
  int get selectedRowCount => 0;
}
