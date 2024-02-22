import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OfferDetailScreen extends StatelessWidget {
  const OfferDetailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      height: 70,
                      width: 70,
                      imageUrl: "imageUrl",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
            )
          ],
        ),
    ),
    );
  }
}
