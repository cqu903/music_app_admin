

/// id : "26k9YoxmESHh9KQGzJnCSPxQUSC"
/// name : "分解质因数加油站解析.pdf"
/// ext : ".pdf"
/// key : "24c6aa18cbe361ced6759f562b677216"
/// fileType : "OTHER"
/// status : "UPLOADED"
/// size : 1996932

class FileVo {
  FileVo({
    String? id,
    String? name,
    String? ext,
    String? key,
    String? fileType,
    String? status,
    int? size,
  }) {
    _id = id;
    _name = name;
    _ext = ext;
    _key = key;
    _fileType = fileType;
    _status = status;
    _size = size;
  }

  FileVo.fromJson(dynamic json) {
    // log(json.toString());
    // log((json.runtimeType.toString()));
    _id = json['id'];
    _name = json['name'];
    _ext = json['ext'];
    _key = json['key'];
    _fileType = json['fileType'];
    _status = json['status'];
    _size = json['size'];
  }

  String? _id;
  String? _name;
  String? _ext;
  String? _key;
  String? _fileType;
  String? _status;
  int? _size;

  String? get id => _id;

  String? get name => _name;

  String? get ext => _ext;

  String? get key => _key;

  String? get fileType => _fileType;

  String? get status => _status;

  int? get size => _size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['ext'] = _ext;
    map['key'] = _key;
    map['fileType'] = _fileType;
    map['status'] = _status;
    map['size'] = _size;
    return map;
  }
}
