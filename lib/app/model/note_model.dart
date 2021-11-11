import 'dart:convert';

class NoteModel {
  int id;
  String title;
  String body;
  DateTime creationDate;

  NoteModel({
    required this.id,
    required this.title,
    required this.body,
    required this.creationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'creationDate': creationDate.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));
}
