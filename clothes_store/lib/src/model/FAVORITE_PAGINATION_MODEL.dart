import 'package:clothes_store/src/model/FAVORITE_MODEL.dart';

class FAVORITE_PAGINATION_MODEL {
  List<FAVORITE_MODEL>? _products;
  int? _totalItem;
  int? _totalPage;
  int? _currentPage;

  FAVORITE_PAGINATION_MODEL(
      {List<FAVORITE_MODEL>? products,
      int? totalItem,
      int? totalPage,
      int? currentPage}) {
    if (products != null) {
      _products = products;
    }
    if (totalItem != null) {
      _totalItem = totalItem;
    }
    if (totalPage != null) {
      _totalPage = totalPage;
    }
    if (currentPage != null) {
      _currentPage = currentPage;
    }
  }

  List<FAVORITE_MODEL>? get products => _products;
  set products(List<FAVORITE_MODEL>? products) => _products = products;
  int? get totalItem => _totalItem;
  set totalItem(int? totalItem) => _totalItem = totalItem;
  int? get totalPage => _totalPage;
  set totalPage(int? totalPage) => _totalPage = totalPage;
  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;

  FAVORITE_PAGINATION_MODEL.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = <FAVORITE_MODEL>[];
      json['products'].forEach((v) {
        _products!.add(FAVORITE_MODEL.fromJson(v));
      });
    }
    _totalItem = json['totalItem'];
    _totalPage = json['totalPage'];
    _currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_products != null) {
      data['products'] = _products!.map((v) => v.toJson()).toList();
    }
    data['totalItem'] = _totalItem;
    data['totalPage'] = _totalPage;
    data['currentPage'] = _currentPage;
    return data;
  }
}
