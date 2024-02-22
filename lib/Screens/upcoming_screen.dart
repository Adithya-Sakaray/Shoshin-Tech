import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(
            Icons.watch_later_outlined,
            color: Colors.amber,
            size: 150,
          ),
          Text("You can view upcoming offers here", style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 20),)
        ],
      ),
    );
  }
}
