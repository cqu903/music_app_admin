/// id : "24mzZtJeep9LhZNwoQnlvWHZOlR"
/// username : "admin"
/// nickname : "roy"
/// gender : "MALE"
/// locked : false
/// enabled : true
/// lastLoginIp : null
/// lastLoginTime : null

class UserVo {
  UserVo({
    String? id,
    String? username,
    String? nickname,
    String? gender,
    bool? locked,
    bool? enabled,
    String? lastLoginIp,
    dynamic lastLoginTime,}) {
    _id = id;
    _username = username;
    _nickname = nickname;
    _gender = gender;
    _locked = locked;
    _enabled = enabled;
    _lastLoginIp = lastLoginIp;
    _lastLoginTime = lastLoginTime;
  }

  UserVo.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _nickname = json['nickname'];
    _gender = json['gender'];
    _locked = json['locked'];
    _enabled = json['enabled'];
    _lastLoginIp = json['lastLoginIp'];
    _lastLoginTime = json['lastLoginTime'];
  }

  String? _id;
  String? _username;
  String? _nickname;
  String? _gender;
  bool? _locked;
  bool? _enabled;
  dynamic _lastLoginIp;
  dynamic _lastLoginTime;

  String? get id => _id;

  String? get username => _username;

  String? get nickname => _nickname;

  String? get gender => _gender;

  bool? get locked => _locked;

  bool? get enabled => _enabled;

  dynamic get lastLoginIp => _lastLoginIp;

  dynamic get lastLoginTime => _lastLoginTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['nickname'] = _nickname;
    map['gender'] = _gender;
    map['locked'] = _locked;
    map['enabled'] = _enabled;
    map['lastLoginIp'] = _lastLoginIp;
    map['lastLoginTime'] = _lastLoginTime;
    return map;
  }

}