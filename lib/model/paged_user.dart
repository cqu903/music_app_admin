import 'package:music_app_admin/model/pageable_vo.dart';

///用于封装分页查询的user对象集合
class PageObj<T> {
  late final PagableVo _pageableVo;
  late final List<T> _content;

  PageObj({required PagableVo pageableVo, required List<T> content}) {
    _pageableVo = pageableVo;
    _content = content;
  }

  PagableVo get pagableVO => _pageableVo;

  List<T> get content => _content;
}
