class PRODUCT_MODEL {
  String? sId;
  int? productID;
  String? name;
  int? targetID;
  String? description;
  int? price;
  int? categoryID;
  String? createdAt;
  String? updatedAt;
  String? thumbnail;
  bool? isActivated;
  List<Colors_Model>? colors;
  int? totalStock;
  String? category;
  String? target;
  bool? inStock;
  bool? isFavorite;
  Promotion? promotion;

  PRODUCT_MODEL({
    this.sId,
    this.productID,
    this.name,
    this.targetID,
    this.description,
    this.price,
    this.categoryID,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
    this.isActivated,
    this.colors,
    this.totalStock,
    this.category,
    this.target,
    this.inStock,
    this.isFavorite,
    this.promotion,
  });

  PRODUCT_MODEL.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productID = json['productID'];
    name = json['name'];
    targetID = json['targetID'];
    description = json['description'];
    price = json['price'];
    categoryID = json['categoryID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    thumbnail = json['thumbnail'];
    isActivated = json['isActivated'];
    if (json['colors'] != null) {
      colors = <Colors_Model>[];
      json['colors'].forEach((v) {
        colors!.add(Colors_Model.fromJson(v));
      });
    }
    totalStock = json['totalStock'];
    category = json['category'];
    target = json['target'];
    inStock = json['inStock'];
    isFavorite = json['isFavorite'];
    promotion = json['promotion'] != null
        ? Promotion.fromJson(json['promotion'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['productID'] = productID;
    data['name'] = name;
    data['targetID'] = targetID;
    data['description'] = description;
    data['price'] = price;
    data['categoryID'] = categoryID;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['thumbnail'] = thumbnail;
    data['isActivated'] = isActivated;
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    data['totalStock'] = totalStock;
    data['category'] = category;
    data['target'] = target;
    data['inStock'] = inStock;
    data['isFavorite'] = isFavorite;
    if (promotion != null) {
      data['promotion'] = promotion!.toJson();
    }
    return data;
  }
}

class Colors_Model {
  String? sId;
  int? colorID;
  int? productID;
  String? colorName;
  List<String>? images;
  List<Sizes>? sizes;

  Colors_Model(
      {this.sId,
      this.colorID,
      this.productID,
      this.colorName,
      this.images,
      this.sizes});

  Colors_Model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    colorID = json['colorID'];
    productID = json['productID'];
    colorName = json['colorName'];
    images = json['images'].cast<String>();
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['colorID'] = colorID;
    data['productID'] = productID;
    data['colorName'] = colorName;
    data['images'] = images;
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  String? sId;
  int? colorID;
  String? size;
  int? stock;
  String? sKU;

  Sizes({this.sId, this.colorID, this.size, this.stock, this.sKU});

  Sizes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    colorID = json['colorID'];
    size = json['size'];
    stock = json['stock'];
    sKU = json['SKU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['colorID'] = colorID;
    data['size'] = size;
    data['stock'] = stock;
    data['SKU'] = sKU;
    return data;
  }
}

class Promotion {
  String? name;
  int? discountPercent;
  double? discountedPrice;
  String? endDate;

  Promotion({
    this.name,
    this.discountPercent,
    this.discountedPrice,
    this.endDate,
  });

  Promotion.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    discountPercent = json['discountPercent'];
    discountedPrice = json['discountedPrice'] != null
        ? (json['discountedPrice'] as num).toDouble()
        : -1;
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['discountPercent'] = discountPercent;
    data['discountedPrice'] = discountedPrice;
    data['endDate'] = endDate;
    return data;
  }
}
