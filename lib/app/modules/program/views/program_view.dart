import 'package:flutter/material.dart';
import 'package:school_program/app/modules/program/components/page_builder.dart';

class ProgramView extends StatelessWidget {
  ProgramView({Key? key}) : super(key: key);

  int initialPage = DateTime.now().weekday - 1;

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      controller: PageController(
        initialPage: initialPage,
      ),
      onPageChanged: (value) => initialPage = value,
      children: [
        PageBuilder(day: "Понеделник"),
        PageBuilder(day: "Вторник"),
        PageBuilder(day: "Сряда"),
        PageBuilder(day: "Четвъртък"),
        PageBuilder(day: "Петък"),
      ],
    );
  }
}
