import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_program/models/homework.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({Key? key}) : super(key: key);

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Домашни"),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "Добави Домашна",
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
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
    );
  }
}
