import 'package:flutter/material.dart';
import 'package:music_app_admin/model/user_vo.dart';
import 'package:music_app_admin/pages/user/user_page.dart';

class UserVoMapperRowMapper{
static  DataRow getRow(
      UserVo userVo,
      SelectedCallBack callback,
      List<String> selectedIds,
      ) {
    return DataRow(
      cells: [
        DataCell(Text("${userVo.id}")),
        DataCell(Text('${userVo.username}')),
        DataCell(Text("${userVo.nickname}")),
      ],
      onSelectChanged: (newState) {
        callback(userVo.id!, newState ?? false);
      },
      selected: selectedIds.contains(userVo.id!),
    );
  }
}