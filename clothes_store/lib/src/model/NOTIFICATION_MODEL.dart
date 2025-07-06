class NOTIFICATION_MODEL {
  String? _sId;
  int? _notificationID;
  String? _title;
  String? _type;
  String? _message;
  int? _readCount;
  String? _scheduledFor;
  String? _expiresAt;
  String? _createdAt;
  String? _createdBy;
  bool? _isRead;
  DateTime? _readAt;
  int? _userNotificationID;

  NOTIFICATION_MODEL(
      {String? sId,
      int? notificationID,
      String? title,
      String? type,
      String? message,
      int? readCount,
      String? scheduledFor,
      String? expiresAt,
      String? createdAt,
      String? createdBy,
      bool? isRead,
      DateTime? readAt,
      int? userNotificationID}) {
    if (sId != null) {
      _sId = sId;
    }
    if (notificationID != null) {
      _notificationID = notificationID;
    }
    if (title != null) {
      _title = title;
    }
    if (type != null) {
      _type = type;
    }
    if (message != null) {
      _message = message;
    }
    if (readCount != null) {
      _readCount = readCount;
    }
    if (scheduledFor != null) {
      _scheduledFor = scheduledFor;
    }
    if (expiresAt != null) {
      _expiresAt = expiresAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (isRead != null) {
      _isRead = isRead;
    }
    if (readAt != null) {
      _readAt = readAt;
    }
    if (userNotificationID != null) {
      _userNotificationID = userNotificationID;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get notificationID => _notificationID;
  set notificationID(int? notificationID) => _notificationID = notificationID;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get message => _message;
  set message(String? message) => _message = message;
  int? get readCount => _readCount;
  set readCount(int? readCount) => _readCount = readCount;
  String? get scheduledFor => _scheduledFor;
  set scheduledFor(String? scheduledFor) => _scheduledFor = scheduledFor;
  String? get expiresAt => _expiresAt;
  set expiresAt(String? expiresAt) => _expiresAt = expiresAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  bool? get isRead => _isRead;
  set isRead(bool? isRead) => _isRead = isRead;
  DateTime? get readAt => _readAt;
  set readAt(DateTime? readAt) => _readAt = readAt;
  int? get userNotificationID => _userNotificationID;
  set userNotificationID(int? userNotificationID) =>
      _userNotificationID = userNotificationID;

  NOTIFICATION_MODEL.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _notificationID = json['notificationID'];
    _title = json['title'];
    _type = json['type'];
    _message = json['message'];
    _readCount = json['readCount'];
    _scheduledFor = json['scheduledFor'];
    _expiresAt = json['expiresAt'];
    _createdAt = json['createdAt'];
    _createdBy = json['createdBy'];
    _isRead = json['isRead'];
    _readAt = json['readAt'] != null
        ? DateTime.parse(json['readAt'])
        : null; // Parse the date-time string
    _userNotificationID = json['userNotificationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = _sId;
    data['notificationID'] = _notificationID;
    data['title'] = _title;
    data['type'] = _type;
    data['message'] = _message;
    data['readCount'] = _readCount;
    data['scheduledFor'] = _scheduledFor;
    data['expiresAt'] = _expiresAt;
    data['createdAt'] = _createdAt;
    data['createdBy'] = _createdBy;
    data['isRead'] = _isRead;
    data['readAt'] = readAt?.toIso8601String(); // Convert DateTime to string
    data['userNotificationID'] = _userNotificationID;
    return data;
  }
}
