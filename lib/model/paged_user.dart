import 'package:music_app_admin/model/pagable_vo.dart';

///用于封装分页查询的user对象集合
class PageObj<T> {
  late final PagableVo _pagableVo;
  late final List<T> _content;

  PageObj({required PagableVo pagableVo, required List<T> content}) {
    _pagableVo = pagableVo;
    _content = content;
  }

  PagableVo get pagableVO => _pagableVo;

  List<T> get content => _content;
}
