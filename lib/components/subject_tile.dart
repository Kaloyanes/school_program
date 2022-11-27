import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_program/models/subject.dart';

class SubjectTile extends StatelessWidget {
  SubjectTile({
    Key? key,
    required this.subject,
    required this.index,
  }) : super(key: key);

  final Subject subject;
  final int index;

  DateFormat formatter = DateFormat("H:mm");

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${index + 1}: ${subject.title}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 15),
                  ),
                  Text(
                    subject.teacher,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              child: FittedBox(
                child: Text(
                    "${formatter.format(subject.startTime)} - ${formatter.format(subject.endTime)}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
