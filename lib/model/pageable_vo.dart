/// last : true
/// totalPages : 1
/// totalElements : 2
/// first : true
/// size : 10
/// number : 0
/// numberOfElements : 2
/// empty : false

class PagableVo {
  PagableVo({
      bool? last, 
      int? totalPages, 
      int? totalElements, 
      bool? first, 
      int? size, 
      int? number, 
      int? numberOfElements, 
      bool? empty,}){
    _last = last;
    _totalPages = totalPages;
    _totalElements = totalElements;
    _first = first;
    _size = size;
    _number = number;
    _numberOfElements = numberOfElements;
    _empty = empty;
}

  PagableVo.fromJson(dynamic json) {
    _last = json['last'];
    _totalPages = json['totalPages'];
    _totalElements = json['totalElements'];
    _first = json['first'];
    _size = json['size'];
    _number = json['number'];
    _numberOfElements = json['numberOfElements'];
    _empty = json['empty'];
  }
  bool? _last;
  int? _totalPages;
  int? _totalElements;
  bool? _first;
  int? _size;
  int? _number;
  int? _numberOfElements;
  bool? _empty;

  bool? get last => _last;
  int? get totalPages => _totalPages;
  int? get totalElements => _totalElements;
  bool? get first => _first;
  int? get size => _size;
  int? get number => _number;
  int? get numberOfElements => _numberOfElements;
  bool? get empty => _empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last'] = _last;
    map['totalPages'] = _totalPages;
    map['totalElements'] = _totalElements;
    map['first'] = _first;
    map['size'] = _size;
    map['number'] = _number;
    map['numberOfElements'] = _numberOfElements;
    map['empty'] = _empty;
    return map;
  }

}