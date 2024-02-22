import 'package:flutter/material.dart';

class MyOffersScreen extends StatelessWidget {
  const MyOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          children: [
            Text("Myoffers Page", style: TextStyle(color: Theme.of(context).colorScheme.onBackground),)
          ],
        ),
      ),
    );
  }
}
