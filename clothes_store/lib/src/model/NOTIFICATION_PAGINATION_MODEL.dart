import 'package:clothes_store/src/model/NOTIFICATION_MODEL.dart';

class NOTIFICATION_PAGINATION_MODEL {
  String? _message;
  List<NOTIFICATION_MODEL>? _notifications;
  Pagination? _pagination;

  NOTIFICATION_PAGINATION_MODEL(
      {String? message,
      List<NOTIFICATION_MODEL>? notifications,
      Pagination? pagination}) {
    if (message != null) {
      _message = message;
    }
    if (notifications != null) {
      _notifications = notifications;
    }
    if (pagination != null) {
      _pagination = pagination;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  List<NOTIFICATION_MODEL>? get notifications => _notifications;
  set notifications(List<NOTIFICATION_MODEL>? notifications) =>
      _notifications = notifications;
  Pagination? get pagination => _pagination;
  set pagination(Pagination? pagination) => _pagination = pagination;

  NOTIFICATION_PAGINATION_MODEL.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    if (json['notifications'] != null) {
      _notifications = <NOTIFICATION_MODEL>[];
      json['notifications'].forEach((v) {
        _notifications!.add(NOTIFICATION_MODEL.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = _message;
    if (_notifications != null) {
      data['notifications'] = _notifications!.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      data['pagination'] = _pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? _total;
  int? _totalPages;
  int? _currentPage;
  int? _limit;

  Pagination({int? total, int? totalPages, int? currentPage, int? limit}) {
    if (total != null) {
      _total = total;
    }
    if (totalPages != null) {
      _totalPages = totalPages;
    }
    if (currentPage != null) {
      _currentPage = currentPage;
    }
    if (limit != null) {
      _limit = limit;
    }
  }

  int? get total => _total;
  set total(int? total) => _total = total;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;

  Pagination.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _totalPages = json['totalPages'];
    _currentPage = json['currentPage'];
    _limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = _total;
    data['totalPages'] = _totalPages;
    data['currentPage'] = _currentPage;
    data['limit'] = _limit;
    return data;
  }
}
