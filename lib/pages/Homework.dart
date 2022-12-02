import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_program/models/homework.dart';
import 'package:school_program/pages/Homework/add_homework.dart';
import 'package:school_program/themes.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({Key? key}) : super(key: key);

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  bool _fabVisible = true;

  final Duration _duration = const Duration(milliseconds: 300);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;

          setState(() {
            if (direction == ScrollDirection.forward) {
              _fabVisible = true;
            } else if (direction == ScrollDirection.reverse) {
              _fabVisible = false;
            }
          });

          return true;
        },
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: homework.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(homework[index].title),
                subtitle: Text(homework[index].description),
                trailing: Text(formatter.format(homework[index].dueDate)),
              ),
            );
          },
        ),
      ),
      floatingActionButton: animated_fab_button(context),
    );
  }

  AppBar app_bar() {
    return AppBar(
      title: const Text("Домашни"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            printInfo(info: Get.isDarkMode.toString());

            setState(() {
              if (Get.isDarkMode) {
                Get.changeThemeMode(ThemeMode.light);
              } else {
                Get.changeThemeMode(ThemeMode.dark);
              }
            });
          },
          icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode),
        ),
      ],
    );
  }

  AnimatedSlide animated_fab_button(BuildContext context) {
    return AnimatedSlide(
      duration: _duration,
      offset: Offset(0, _fabVisible ? 0 : 1),
      curve: Curves.easeInOutQuart,
      child: AnimatedScale(
        duration: _duration,
        curve: Curves.easeInOutQuart,
        scale: _fabVisible ? 1 : 0,
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          transitionDuration: const Duration(milliseconds: 300),
          openShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          openBuilder: (context, action) => AddHomeworkPage(),
          closedElevation: 10,
          middleColor: Color.alphaBlend(
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.primaryContainer,
          ),
          openColor: Theme.of(context).colorScheme.background,
          closedColor: Theme.of(context).colorScheme.primaryContainer,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          closedBuilder: (context, action) => FloatingActionButton.extended(
            backgroundColor: Colors.transparent,
            // label: const Text("Добави"),
            onPressed: action,
            elevation: 0,
            disabledElevation: 0,
            enableFeedback: true,
            label: const Text("Добави"),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
