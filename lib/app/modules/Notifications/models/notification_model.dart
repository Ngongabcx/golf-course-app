final String tableNotifications = 'notifications';

class NotificationFields {
  static final List<String> values = [
    /// Add all fields
    id, isRead, messageId, title, body, createdTime
  ];

  static final String id = '_id';
  static final String isRead = 'isRead';
  static final String messageId = 'messageId';
  static final String title = 'title';
  static final String body = 'body';
  static final String createdTime = 'createdTime';
}

class FCMNotification {
  final int? id;
  final bool isRead;
  final String messageId;
  final String title;
  final String body;
  final DateTime createdTime;

  const FCMNotification({
    this.id,
    required this.isRead,
    required this.messageId,
    required this.title,
    required this.body,
    required this.createdTime,
  });

  FCMNotification copy({
    int? id,
    bool? isRead,
    String? messageId,
    String? title,
    String? body,
    DateTime? createdTime,
  }) =>
      FCMNotification(
        id: id ?? this.id,
        isRead: isRead ?? this.isRead,
        messageId: messageId ?? this.messageId,
        title: title ?? this.title,
        body: body ?? this.body,
        createdTime: createdTime ?? this.createdTime,
      );

  static FCMNotification fromJson(Map<String, Object?> json) => FCMNotification(
        id: json[NotificationFields.id] as int?,
        isRead: json[NotificationFields.isRead] == 1,
        messageId: json[NotificationFields.messageId] as String,
        title: json[NotificationFields.title] as String,
        body: json[NotificationFields.body] as String,
        createdTime: DateTime.parse(json[NotificationFields.createdTime] as String),
      );

  Map<String, Object?> toJson() => {
        NotificationFields.id: id,
        NotificationFields.title: title,
        NotificationFields.isRead: isRead ? 1 : 0,
        NotificationFields.messageId: messageId,
        NotificationFields.body: body,
        NotificationFields.createdTime: createdTime.toIso8601String(),
      };
}
