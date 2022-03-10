/// token : "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiJ9.6sLqaC7i9N5nduCTjSWc_cQMJmhpnu4gnjUEph4Kr2w"

class TokenVo {
  TokenVo({
      String? token,}){
    _token = token;
}

  TokenVo.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}