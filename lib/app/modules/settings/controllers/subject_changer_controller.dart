import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_program/app/models/day.dart';
import 'package:school_program/app/models/subject.dart';

class SubjectChangerController extends GetxController {
  final subjectStorage = GetStorage("days");

  final days = <Day>[].obs;

  @override
  onInit() {
    super.onInit();
    days.add(subjectStorage.read("monday") ?? Day("Понеделник", <Subject>[].obs));
    days.add(subjectStorage.read("tuesday") ?? Day("Вторник", <Subject>[].obs));
    days.add(subjectStorage.read("wednesday") ?? Day("Сряда", <Subject>[].obs));
    days.add(subjectStorage.read("thursday") ?? Day("Четвъртък", <Subject>[].obs));
    days.add(subjectStorage.read("friday") ?? Day("Петък", <Subject>[].obs));
  }
}
