import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:music_app_admin/api/user_api.dart';
import 'package:music_app_admin/model/page.dart' as page;
import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/model/user_vo_row_mapper.dart';
import 'package:music_app_admin/pages/user/temp.dart';
import 'package:music_app_admin/utils/log_util.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final _source = ExampleSource();
  final _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // search(page.Page(page: 0, size: 10)).then((value) => setState(() {
    //       users = value;
    //     }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AdvancedPaginatedDataTable(
        addEmptyRows: false,
        source: _source,
        showFirstLastButtons: true,
        rowsPerPage: rowsPerPage,
        availableRowsPerPage: const [10, 20, 30, 50],
        onRowsPerPageChanged: (newRowsPerPage){
          if(newRowsPerPage!=null){
            setState(() {
              rowsPerPage = newRowsPerPage;
            });
          }
        },
        columns: const [
          DataColumn(label: Text('主键')),
          DataColumn(label: Text('用户名')),
        ],
      ),
    );
  }
}
typedef SelectedCallBack = Function(String id, bool newSelectState);
class ExampleSource extends AdvancedDataTableSource<UserVo> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';

  @override
  DataRow? getRow(int index) =>
    UserVoMapperRowMapper.getRow( lastDetails!.rows[index], selectedRow, selectedIds);

  @override
  int get selectedRowCount => selectedIds.length;

  // ignore: avoid_positional_boolean_parameters
  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<UserVo>> getNextPage(
      NextPageRequest pageRequest,
      ) async {
    //the remote data source has to support the pagaing and sorting
    List<UserVo> users = await search(page.Page(page: pageRequest.offset,size: pageRequest.pageSize));
    return RemoteDataSourceDetails(100, users);


  }
}
