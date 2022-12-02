import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_program/components/page_builder.dart';
import 'package:school_program/pages/Homework.dart';
import 'package:school_program/pages/Program.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  Widget currentPage = ProgramPage();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    var pages = <Widget>[
      ProgramPage(),
      const HomeworkPage(),
      const Scaffold(),
    ];

    // IndexedStack(
    //       index: selectedIndex,
    //       children: pages,
    //     ),

    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          if (selectedIndex == value) return;

          setState(() {
            selectedIndex = value;
            // Change currentPage with animation
          });
        },
        animationDuration: const Duration(milliseconds: 600),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Програма',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_work_outlined),
            selectedIcon: Icon(Icons.home_work),
            label: 'Домашни',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz),
            label: 'Тестове',
          ),
        ],
      ),
    );
  }
}
