///用于封装分页查询的user对象集合
class PageObj<T>{
  int totalCount;
  List<T> content;
  PageObj({required this.totalCount,required this.content});
}