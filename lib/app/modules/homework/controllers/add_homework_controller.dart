import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddHomeworkController extends GetxController {
  //TODO: Implement AddHomeworkController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  final dueDate = DateTime.now().obs;
}
