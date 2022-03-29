import 'package:music_app_admin/model/FileVo.dart';

/// id : "26QYfhqlfjiWhVD1aecBzyJl8Vh"
/// name : "月亮之上"
/// status : "DRAFT"
/// description : "凤凰传奇的歌"
/// createTime : "2022-03-15 23:16:21"
/// updatedTime : "2022-03-15 23:16:21"

class MusicVo {
  MusicVo({
    String? id,
    String? name,
    String? description,
    String? createTime,
    String? updatedTime,
    FileVo? file,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _createTime = createTime;
    _updatedTime = updatedTime;
    _file = file;
  }

  MusicVo.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _createTime = json['createTime'];
    _updatedTime = json['updatedTime'];
    _file = json['file'] != null ? FileVo.fromJson(json['file']) : null;
  }

  String? _id;
  String? _name;
  String? _description;
  String? _createTime;
  String? _updatedTime;
  FileVo? _file;

  String? get id => _id;

  String? get name => _name;

  String? get description => _description;

  String? get createTime => _createTime;

  String? get updatedTime => _updatedTime;

  FileVo? get file => _file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['createTime'] = _createTime;
    map['updatedTime'] = _updatedTime;
    if (_file != null) {
      map['file'] = _file?.toJson();
    }
    return map;
  }
}
