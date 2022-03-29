class Page {
  int? _page;
  int? _size;

  Page({int? page, int? size}) {
    _page = page;
    _size = size;
  }

  int? get page => _page;

  int? get size => _size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['size'] = _size;
    return map;
  }
}
