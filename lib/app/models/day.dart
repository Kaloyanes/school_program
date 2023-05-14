import 'package:get/get.dart';
import 'package:school_program/app/models/subject.dart';

class Day {
  String name;
  RxList<Subject> subjects;

  Day(this.name, this.subjects);
}
