// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Homework {
  final String title;
  final String description;
  final DateTime dueDate;

  Homework({
    required this.title,
    required this.description,
    required this.dueDate,
  });

  Homework copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
  }) {
    return Homework(
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'dueDate': dueDate.millisecondsSinceEpoch,
    };
  }

  factory Homework.fromMap(Map<String, dynamic> map) {
    return Homework(
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Homework.fromJson(String source) =>
      Homework.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Homework(title: $title, description: $description, dueDate: $dueDate)';

  @override
  bool operator ==(covariant Homework other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ dueDate.hashCode;
}
