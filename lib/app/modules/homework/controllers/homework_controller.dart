import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/models/homework.dart';

class HomeworkController extends GetxController {
  //TODO: Implement HomeworkController

  final fabVisible = true.obs;

  final Duration duration = const Duration(milliseconds: 600);

  DateFormat formatter = DateFormat('dd/MM/yyyy');
  List<Homework> homework = [
    Homework(
      title: "Math",
      description: "Do page 1-5",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "English",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "Science",
      description: "Do page 1-5",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
    Homework(
      title: "History",
      description: "Read chapter 1",
      dueDate: DateTime.now(),
    ),
  ];

  bool scrolled(UserScrollNotification notification) {
    final ScrollDirection direction = notification.direction;

    if (direction == ScrollDirection.forward) {
      fabVisible.value = true;
    } else if (direction == ScrollDirection.reverse) {
      fabVisible.value = false;
    }

    return true;
  }
}
