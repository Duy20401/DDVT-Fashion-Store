class USER_MODEL {
  int? _userID;
  String? _fullname;
  String? _gender;
  String? _email;
  String? _password;
  String? _phone;
  String? _token;
  String? _avatar;

  USER_MODEL({
    int? userID,
    String? fullname,
    String? gender,
    String? email,
    String? password,
    String? phone,
    String? token,
    String? avatar,
  }) {
    if (userID != null) {
      _userID = userID;
    }
    if (fullname != null) {
      _fullname = fullname;
    }
    if (gender != null) {
      _gender = gender;
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (token != null) {
      _token = token;
    }
    if (avatar != null) {
      _avatar = avatar;
    }
  }

  int? get userID => _userID;
  set userID(int? userID) => _userID = userID;
  String? get fullname => _fullname;
  set fullname(String? fullname) => _fullname = fullname;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get avatar => _avatar;
  set avatar(String? avatar) => _avatar = avatar;

  USER_MODEL.fromJson(Map<String, dynamic> json) {
    _userID = json['userID'];
    _fullname = json['fullname'];
    _gender = json['gender'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = _userID;
    data['fullname'] = _fullname;
    data['gender'] = _gender;
    data['email'] = _email;
    data['password'] = _password;
    data['phone'] = _phone;
    data['token'] = _token;
    data['avatar'] = _avatar;
    return data;
  }

  @override
  String toString() {
    return 'USER_MODEL{_userID: $_userID, _fullname: $_fullname, _gender: $_gender, _email: $_email, _password: $_password, _phone: $_phone, _token: $_token, _avatar: $_avatar}';
  }

  // Convert USER_MODEL object to a map
  Map<String, dynamic> toMap() {
    return {
      'userID': _userID,
      'fullname': _fullname,
      'gender': _gender,
      'email': _email,
      'password': _password,
      'phone': _phone,
      'token': _token,
      'avatar': _avatar,
    };
  }
}
