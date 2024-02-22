import 'package:flutter/material.dart';

class MyOffersScreen extends StatelessWidget {
  const MyOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.deepPurple,
            size: 150,
          ),
          Text("You can view your offers here", style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 20),)
        ],
      ),
    );
  }
}
