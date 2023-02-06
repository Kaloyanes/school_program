import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_program/app/models/subject.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primaryContainer,
            spreadRadius: 0.2,
            blurRadius: 16,
            offset: Offset.zero,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${index + 1}: ${subject.title}",
                    style: Theme.of(context).textTheme.titleMedium!,
                  ),
                  Text(
                    subject.teacher,
                    style: Theme.of(context).textTheme.bodyMedium!,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Text(
                    "${formatter.format(subject.startTime)} - ${formatter.format(subject.endTime)}",
                    style: Theme.of(context).textTheme.titleMedium!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
