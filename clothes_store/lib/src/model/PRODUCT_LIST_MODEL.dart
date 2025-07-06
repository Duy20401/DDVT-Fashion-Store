import 'package:clothes_store/src/model/PRODUCT_MODEL.dart';

class PRODUCT_LIST_MODEL {
  List<PRODUCT_MODEL>? products;
  int? total;
  int? totalPages;
  int? currentPage;

  PRODUCT_LIST_MODEL(
      {this.products, this.total, this.totalPages, this.currentPage});

  PRODUCT_LIST_MODEL.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <PRODUCT_MODEL>[];
      json['products'].forEach((v) {
        products!.add(PRODUCT_MODEL.fromJson(v));
      });
    }
    total = json['total'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    return data;
  }
}
