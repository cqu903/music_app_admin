/// musicId : "dadfadf"
/// fileId : "dfafadf"

class MusicFileLinkRequest {
  MusicFileLinkRequest({
    String? musicId,
    String? fileId,
  }) {
    _musicId = musicId;
    _fileId = fileId;
  }

  MusicFileLinkRequest.fromJson(dynamic json) {
    _musicId = json['musicId'];
    _fileId = json['fileId'];
  }

  String? _musicId;
  String? _fileId;

  String? get musicId => _musicId;

  String? get fileId => _fileId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['musicId'] = _musicId;
    map['fileId'] = _fileId;
    return map;
  }
}
