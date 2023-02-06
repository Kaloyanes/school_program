import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Subject {
  String title;
  String teacher = "";
  DateTime startTime;
  DateTime endTime = DateTime.now();

  Subject(this.title, this.startTime) {
    endTime = startTime.add(const Duration(minutes: 40));
    setTeacher();
  }

  Future<void> setTeacher() async {
    final String response = await rootBundle.loadString('assets/teachers.json');
    final Map<String, dynamic> data = await json.decode(response);

    teacher = data[title] ?? "";
  }

  @override
  String toString() {
    DateFormat formatter = DateFormat("H:mm");

    return "Предмет: $title\nУчител: $teacher\nНачало на часа: ${formatter.format(startTime)}\nКрай на часа: ${formatter.format(endTime)}";
  }
}
