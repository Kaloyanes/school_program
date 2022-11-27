import 'package:flutter/material.dart';
import 'package:school_program/components/page_builder.dart';

class ProgramPage extends StatelessWidget {
  ProgramPage({Key? key}) : super(key: key);

  int initialPage = DateTime.now().weekday - 1;

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      physics: const BouncingScrollPhysics(),
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
