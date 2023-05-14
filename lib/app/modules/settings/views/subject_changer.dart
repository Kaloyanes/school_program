import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_program/app/models/subject.dart';
import 'package:school_program/app/modules/program/components/subject_tile.dart';
import 'package:school_program/app/modules/settings/controllers/subject_changer_controller.dart';

class SubjectChanger extends GetView<SubjectChangerController> {
  const SubjectChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SubjectChangerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Промени часовете"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              for (var day in controller.days)
                Obx(
                  () => ExpansionTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(day.name),
                    trailing: IntrinsicWidth(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              day.subjects.add(
                                Subject(
                                  "maika ti",
                                  DateTime.now(),
                                  DateTime.now().add(const Duration(minutes: 40)),
                                  "Петър Петров",
                                ),
                              );
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text('Добавен е предмета')));
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    children: [
                      if (day.subjects.value.isEmpty)
                        Padding(
                          key: ObjectKey("empty ${day.name}"),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Нямате часове за този ден",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      for (int i = 0; i < day.subjects.length; i++)
                        Dismissible(
                          onDismissed: (direction) {
                            day.subjects.removeAt(i);

                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Махнат е предмета')));
                          },
                          key: ObjectKey(i),
                          child: SubjectTile(
                            subject: day.subjects[i],
                            index: i,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
