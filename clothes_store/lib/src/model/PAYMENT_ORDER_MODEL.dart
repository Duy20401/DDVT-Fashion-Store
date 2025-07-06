class PAYMENT_ORDER_MODEL {
  String? _fullname;
  String? _phone;
  String? _email;
  String? _address;
  String? _note;
  String? _paymentMethod;
  String? _selectedBank;
  String? _bankAccountNumber;
  List<Items>? _items;
  double? _totalPrice;
  int? _userCouponsID;
  double? _paymentPrice;

  PAYMENT_ORDER_MODEL(
      {String? fullname,
      String? phone,
      String? email,
      String? address,
      String? note,
      String? paymentMethod,
      String? selectedBank,
      String? bankAccountNumber,
      List<Items>? items,
      double? totalPrice,
      int? userCouponsID,
      double? paymentPrice}) {
    if (fullname != null) {
      _fullname = fullname;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (email != null) {
      _email = email;
    }
    if (address != null) {
      _address = address;
    }
    if (note != null) {
      _note = note;
    }
    if (paymentMethod != null) {
      _paymentMethod = paymentMethod;
    }
    if (selectedBank != null) {
      _selectedBank = selectedBank;
    }
    if (bankAccountNumber != null) {
      _bankAccountNumber = bankAccountNumber;
    }
    if (items != null) {
      _items = items;
    }
    if (totalPrice != null) {
      _totalPrice = totalPrice;
    }
    if (userCouponsID != null) {
      _userCouponsID = userCouponsID;
    }
    if (paymentPrice != null) {
      _paymentPrice = paymentPrice;
    }
  }

  String? get fullname => _fullname;
  set fullname(String? fullname) => _fullname = fullname;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get note => _note;
  set note(String? note) => _note = note;
  String? get paymentMethod => _paymentMethod;
  set paymentMethod(String? paymentMethod) => _paymentMethod = paymentMethod;
  String? get selectedBank => _selectedBank;
  set selectedBank(String? selectedBank) => _selectedBank = selectedBank;
  String? get bankAccountNumber => _bankAccountNumber;
  set bankAccountNumber(String? bankAccountNumber) =>
      _bankAccountNumber = bankAccountNumber;
  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;
  double? get totalPrice => _totalPrice;
  set totalPrice(double? totalPrice) => _totalPrice = totalPrice;
  int? get userCouponsID => _userCouponsID;
  set userCouponsID(int? userCouponsID) => _userCouponsID = userCouponsID;
  double? get paymentPrice => _paymentPrice;
  set paymentPrice(double? paymentPrice) => _paymentPrice = paymentPrice;

  PAYMENT_ORDER_MODEL.fromJson(Map<String, dynamic> json) {
    _fullname = json['fullname'];
    _phone = json['phone'];
    _email = json['email'];
    _address = json['address'];
    _note = json['note'];
    _paymentMethod = json['paymentMethod'];
    _selectedBank = json['selectedBank'];
    _bankAccountNumber = json['bankAccountNumber'];
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(Items.fromJson(v));
      });
    }
    _totalPrice = (json['totalPrice'] as num).toDouble();
    _userCouponsID = json['userCouponsID'];
    _paymentPrice = (json['paymentPrice'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = _fullname;
    data['phone'] = _phone;
    data['email'] = _email;
    data['address'] = _address;
    data['note'] = _note;
    data['paymentMethod'] = _paymentMethod;
    data['selectedBank'] = _selectedBank;
    data['bankAccountNumber'] = _bankAccountNumber;
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = _totalPrice;
    data['userCouponsID'] = _userCouponsID;
    data['paymentPrice'] = _paymentPrice;
    return data;
  }
}

class Items {
  String? _sKU;
  int? _quantity;
  double? _price;

  Items({String? sKU, int? quantity, double? price}) {
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

  Items.fromJson(Map<String, dynamic> json) {
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
}
