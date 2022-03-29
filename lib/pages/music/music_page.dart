import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app_admin/model/FileVo.dart';
import 'package:music_app_admin/model/music_vo.dart';
import 'package:music_app_admin/pages/music/add_music_dialog.dart';
import 'package:music_app_admin/theme.dart';
import 'package:music_app_admin/widgets/uploader.dart';

import '../../api/music_api.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: list(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            } else if (snapshot.hasData) {
              final List<MusicVo> musicVos = snapshot.data as List<MusicVo>;
              var source =
                  MusicDataSource(musicVos: musicVos, context: context);
              return PaginatedDataTable(
                rowsPerPage: 10,
                header: const Text("音乐列表"),
                actions: [
                  ElevatedButton.icon(
                      onPressed: () async {
                        MusicVo? musicVo = await showDialog<MusicVo?>(
                          context: context,
                          builder: (_) => AddMusicDialog(),
                        );
                        if (musicVo != null) {
                          source.addRow(musicVo);
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("新增"))
                ],
                columns: const [
                  DataColumn(label: Text('歌曲名')),
                  DataColumn(label: Text('描述')),
                  DataColumn(label: Text('创建时间')),
                  DataColumn(label: Text('更新时间')),
                  DataColumn(label: Text('歌曲')),
                  DataColumn(label: Text('操作')),
                ],
                source: source,
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class MusicDataSource extends DataTableSource {
  final int _selectedCount = 0;
  List<MusicVo> musicVos;

  BuildContext context;

  MusicDataSource({required this.musicVos, required this.context});

  Future<void> rebuildData() async {
    list().then((value) {
      musicVos = value;
      notifyListeners();
    });
  }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= musicVos.length) return null;
    final MusicVo musicVo = musicVos[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${musicVo.name}')),
      DataCell(Text("${musicVo.description}")),
      DataCell(Text("${musicVo.createTime}")),
      DataCell(Text("${musicVo.updatedTime}")),
      DataCell(Text("${musicVo.file?.name}")),
      DataCell(musicVo.file == null
          ? InkWell(
              child: Container(
                child: const Text(
                  "上传音乐",
                  style: TextStyle(color: primary),
                ),
                margin: const EdgeInsets.only(right: 10),
              ),
              onTap: () async {
                FileVo? fileVo = await showUploaderDialog(context,
                    limitSize: 10000000, extensions: ["mp3", "wav"]);
                if (fileVo != null) {
                  assert(fileVo.id != null);
                  linkFile(musicVo.id!, fileVo.id!).then((_) => rebuildData());
                }
              },
            )
          : InkWell(
              child: Container(
                child: const Text(
                  "编辑",
                  style: TextStyle(color: primary),
                ),
                margin: const EdgeInsets.only(right: 10),
              ),
              onTap: () {},
            )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => musicVos.length;

  @override
  int get selectedRowCount => _selectedCount;

  void addRow(MusicVo musicVo) {
    list().then((value) {
      musicVos = value;
      notifyListeners();
    });
  }
}
