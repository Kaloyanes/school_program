import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:school_program/app/models/day.dart';
import 'package:school_program/app/models/subject.dart';
import 'package:share_plus/share_plus.dart';

import 'break_tile.dart';
import 'subject_tile.dart';

class PageBuilder extends StatelessWidget {
  PageBuilder({Key? key, required this.day, this.isPage = false})
      : super(key: key);

  final String day;
  List<dynamic> subjects = [];

  int numberSubject = 0;

  bool isPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar.medium(
            forceElevated: innerBoxIsScrolled,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                day,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              centerTitle: true,
            ),
            stretch: true,
          ),
        ],
        body: FutureBuilder(
          future: getFiles(),
          builder: (context, snapshot) {
            return ListView(
              cacheExtent: 10000,
              children: [
                for (var index = 0; index < subjects.length; index++)
                  Builder(
                    builder: (context) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (index == 0 || index % 2 == 0) {
                        return GestureDetector(
                          onLongPress: () => shareSubject(subjects[index]),
                          child: SubjectTile(
                            subject: subjects[index],
                            index: index ~/ 2,
                          ),
                        );
                      }

                      if (index != subjects.length - 1) {
                        return BreakTile(int.parse(subjects[index]));
                      }

                      // Bottom padding
                      return Container(
                        height: 10,
                        color: Colors.transparent,
                      );
                    },
                  )
              ].animate(interval: 50.ms).scaleXY(
                    alignment: Alignment.bottomCenter,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: 300.ms,
                  ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getFiles() async {
    subjects.clear();
    int indexDay = 0;
    // read from json file and add to list of days
    Day today = await readDayJson();
    List<String> time = await readTimeJson();

    for (int i = 0;
        i < today.subjects.length + today.subjects.length - 1;
        i++) {
      if (i % 2 == 0 || i == 0) {
        subjects.add(Subject(
            today.subjects[indexDay], DateTime.parse("2021-01-01 ${time[i]}")));
        indexDay++;
      } else {
        subjects.add(time[i]);
      }
    }

    subjects.add("space");
  }

  Future<Day> readDayJson() async {
    int index = -1;
    final String week = await rootBundle.loadString('assets/week.json');
    final weekData = await json.decode(week);

    switch (day) {
      case "Понеделник":
        index = 0;
        break;
      case "Вторник":
        index = 1;
        break;
      case "Сряда":
        index = 2;
        break;
      case "Четвъртък":
        index = 3;
        break;
      case "Петък":
        index = 4;
        break;
      default:
        index = 0;
    }

    var subjects = weekData[index]["subjects"] as List;

    List<String> subjectsList = subjects.map((e) => e.toString()).toList();

    return Day(weekData[index]["name"], subjectsList);
  }

  Future<List<String>> readTimeJson() async {
    final String time = await rootBundle.loadString('assets/time.json');
    final timeData = await json.decode(time);

    var times = timeData as List;

    List<String> timeList = times.map((e) => e.toString()).toList();

    return timeList;
  }

  void shareSubject(Subject subject) {
    HapticFeedback.mediumImpact();
    Share.shareWithResult(subject.toString());
  }
}
