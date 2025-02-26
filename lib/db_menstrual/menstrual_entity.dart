class MenstrualEntity {
  int id;
  DateTime createdTime;
  String content;

  MenstrualEntity({
    required this.id,
    required this.createdTime,
    required this.content,
  });

  MenstrualEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdTime = DateTime.parse(json['createdTime']),
        content = json['content'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'createdTime': createdTime.toIso8601String(),
    'content': content,
  };
}