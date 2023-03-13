// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Test {
  final String uid;
  final String title;
  final DateTime dayOfDeath;

  Test(
    this.uid,
    this.title,
    this.dayOfDeath,
  );

  Test copyWith({
    String? uid,
    String? title,
    DateTime? dayOfDeath,
  }) {
    return Test(
      uid ?? this.uid,
      title ?? this.title,
      dayOfDeath ?? this.dayOfDeath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'dayOfDeath': dayOfDeath.millisecondsSinceEpoch,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      map['uid'] as String,
      map['title'] as String,
      DateTime.fromMillisecondsSinceEpoch(map['dayOfDeath'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) =>
      Test.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Test(uid: $uid, title: $title, dayOfDeath: $dayOfDeath)';

  @override
  bool operator ==(covariant Test other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.title == title &&
        other.dayOfDeath == dayOfDeath;
  }

  @override
  int get hashCode => uid.hashCode ^ title.hashCode ^ dayOfDeath.hashCode;
}
