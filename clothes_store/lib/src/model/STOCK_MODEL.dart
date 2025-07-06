class STOCK_MODEL {
  String? _sKU;
  String? _size;
  int? _stock;

  STOCK_MODEL({String? sKU, String? size, int? stock}) {
    if (sKU != null) {
      _sKU = sKU;
    }
    if (size != null) {
      _size = size;
    }
    if (stock != null) {
      _stock = stock;
    }
  }

  String? get sKU => _sKU;
  set sKU(String? sKU) => _sKU = sKU;
  String? get size => _size;
  set size(String? size) => _size = size;
  int? get stock => _stock;
  set stock(int? stock) => _stock = stock;

  STOCK_MODEL.fromJson(Map<String, dynamic> json) {
    _sKU = json['SKU'];
    _size = json['size'];
    _stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SKU'] = _sKU;
    data['size'] = _size;
    data['stock'] = _stock;
    return data;
  }
}
