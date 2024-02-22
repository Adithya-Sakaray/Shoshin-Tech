import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoreOfferContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int rewardPrice;
  final users;
  final colorString;
  const MoreOfferContainer({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rewardPrice,
    required this.users,
    required this.colorString

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 90,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000),
            width: 2,
          )
        ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      height: 70,
                      width: 70,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => const Icon(Icons.image),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(color: Colors.black, fontSize: 16,), maxLines: 1, overflow: TextOverflow.ellipsis,),

                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Get ₹$rewardPrice", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 13,), maxLines: 1, overflow: TextOverflow.ellipsis,),
                              ),
                            ),

                            const SizedBox(width: 120,),

                            Text(
                              "⚡ $users",
                              style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),

                          ],
                        )
                      ],
                    ),
                  )
                ],
            ),
          ),
      ),
    );
  }
}
