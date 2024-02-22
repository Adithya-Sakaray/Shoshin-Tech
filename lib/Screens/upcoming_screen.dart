import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          children: [
            Text("Upcoming Page", style: TextStyle(color: Theme.of(context).colorScheme.onBackground),)
          ],
        ),
      ),
    );
  }
}
