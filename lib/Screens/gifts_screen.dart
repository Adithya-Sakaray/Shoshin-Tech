import 'package:flutter/material.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({super.key});

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          children: [
            Text("Gifts Page", style: TextStyle(color: Theme.of(context).colorScheme.onBackground),)
          ],
        ),
      ),
    );
  }
}
