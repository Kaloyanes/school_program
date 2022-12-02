import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddHomeworkPage extends StatefulWidget {
  AddHomeworkPage({Key? key}) : super(key: key);

  @override
  State<AddHomeworkPage> createState() => _AddHomeworkPageState();
}

class _AddHomeworkPageState extends State<AddHomeworkPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  DateTime _dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "addHomework",
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Добави домашно"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Заглавие"),
                  ),
                ),
                const Spacer(),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Описание"),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Краен срок: " + formatter.format(_dueDate),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _dueDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        ).then((value) {
                          setState(() {
                            _dueDate = value!;
                          });
                        });
                      },
                      child: const Text("Избери"),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Добави"),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Откажи"),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
