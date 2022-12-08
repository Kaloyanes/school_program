import 'package:flutter/material.dart';

class BreakTile extends StatelessWidget {
  const BreakTile(this.minutes, {Key? key}) : super(key: key);

  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              minutes.toString(),
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            ),
            Text(
              "минути",
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
