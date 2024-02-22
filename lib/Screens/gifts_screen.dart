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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            Icons.card_giftcard_rounded,
            color: Theme.of(context).colorScheme.tertiary,
            size: 150,
          ),
          Text("You can view your gifts here", style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 20),)
        ],
      ),
    );
  }
}
