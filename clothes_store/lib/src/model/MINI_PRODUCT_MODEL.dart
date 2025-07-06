class MINI_PRODUCT_MODEL {
  String? _sKU;
  int? _quantity;
  double? _price;

  MINI_PRODUCT_MODEL({String? sKU, int? quantity, double? price}) {
    if (sKU != null) {
      _sKU = sKU;
    }
    if (quantity != null) {
      _quantity = quantity;
    }
    if (price != null) {
      _price = price;
    }
  }

  String? get sKU => _sKU;
  set sKU(String? sKU) => _sKU = sKU;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  double? get price => _price;
  set price(double? price) => _price = price;

  MINI_PRODUCT_MODEL.fromJson(Map<String, dynamic> json) {
    _sKU = json['SKU'];
    _quantity = json['quantity'];
    _price = (json['price'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SKU'] = _sKU;
    data['quantity'] = _quantity;
    data['price'] = _price;
    return data;
  }

  @override
  String toString() {
    return 'MINI_PRODUCT_MODEL{_sKU: $_sKU, _quantity: $_quantity, _price: $_price}';
  }
}
