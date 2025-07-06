class CATEGORY_MODEL {
  int? _categoryID;
  String? _name;
  String? _imageURL;
  bool _isSelected = false;

  CATEGORY_MODEL({int? categoryID, String? name, String? imageURL}) {
    if (categoryID != null) {
      _categoryID = categoryID;
    }
    if (name != null) {
      _name = name;
    }
    if (imageURL != null) {
      _imageURL = imageURL;
    }
  }

  int? get categoryID => _categoryID;
  set categoryID(int? categoryID) => _categoryID = categoryID;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get imageURL => _imageURL;
  set imageURL(String? imageURL) => _imageURL = imageURL;
  bool get isSelected => _isSelected;
  set isSelected(bool isSelected) => _isSelected = isSelected;

  CATEGORY_MODEL.fromJson(Map<String, dynamic> json) {
    _categoryID = json['categoryID'];
    _name = json['name'];
    _imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryID'] = _categoryID;
    data['name'] = _name;
    data['imageURL'] = _imageURL;
    return data;
  }
}
