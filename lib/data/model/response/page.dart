import 'package:timesheet/data/model/response/department.dart';

class Page{
  Page({
    required this.content,
    required this.pageable,
    required this.totalElements,
    required this.totalPages,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });
  late final List<Department> content;
  late final Pageable pageable;
  late final int totalElements;
  late final int totalPages;
  late final bool last;
  late final int size;
  late final int number;
  late final Sort sort;
  late final bool first;
  late final int numberOfElements;
  late final bool empty;

  Page.fromJson(Map<String, dynamic> json){
    content = List.from(json['content']).map((e)=>Department.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = Sort.fromJson(json['sort']);
    first = json['first'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e)=>e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    _data['totalElements'] = totalElements;
    _data['totalPages'] = totalPages;
    _data['last'] = last;
    _data['size'] = size;
    _data['number'] = number;
    _data['sort'] = sort.toJson();
    _data['first'] = first;
    _data['numberOfElements'] = numberOfElements;
    _data['empty'] = empty;
    return _data;
  }
}

class Content {
  Content({
    required this.id,
    required this.parent,
    required this.icon,
    required this.text,
  });
  late final String id;
  late final String parent;
  late final String icon;
  late final String text;

  Content.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parent = json['parent'];
    icon = json['icon'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent'] = parent;
    _data['icon'] = icon;
    _data['text'] = text;
    return _data;
  }
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });
  late final Sort sort;
  late final int offset;
  late final int pageSize;
  late final int pageNumber;
  late final bool paged;
  late final bool unpaged;

  Pageable.fromJson(Map<String, dynamic> json){
    sort = Sort.fromJson(json['sort']);
    offset = json['offset'];
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sort'] = sort.toJson();
    _data['offset'] = offset;
    _data['pageSize'] = pageSize;
    _data['pageNumber'] = pageNumber;
    _data['paged'] = paged;
    _data['unpaged'] = unpaged;
    return _data;
  }
}

class Sort {
  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });
  late final bool sorted;
  late final bool unsorted;
  late final bool empty;

  Sort.fromJson(Map<String, dynamic> json){
    sorted = json['sorted'];
    unsorted = json['unsorted'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sorted'] = sorted;
    _data['unsorted'] = unsorted;
    _data['empty'] = empty;
    return _data;
  }
}