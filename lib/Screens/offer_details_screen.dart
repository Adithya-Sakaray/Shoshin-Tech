import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:shoshin_app/Controller/offer_details_controller.dart';
import 'package:shoshin_app/Screens/loading_screen.dart';
import 'package:shoshin_app/utils/gaps.dart';
import 'package:shoshin_app/utils/my_button.dart';
import 'package:shoshin_app/utils/offer_detial_container.dart';

class OfferDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String users;
  final int totalAmount;
  final double appRating;

  const OfferDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.users,
    required this.totalAmount,
    required this.appRating,
  });

  @override
  Widget build(BuildContext context) {
    OfferDetailsController offerDetailsController = Get.put(OfferDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Offer Details"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Obx(() {
            if (offerDetailsController.offerDetails.isEmpty) {
              return const Center(
                child: LoadingScreen()
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          height: 90,
                          width: 90,
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onBackground,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                description,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                ),
                              ),
                              RatingStars(
                                editable: true,
                                rating: appRating,
                                color: Colors.amber,
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  mediumGap(),
                  Text(
                    "Steps(1/4)",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  smallGap(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OfferDetailContainer(
                        isCompleted: offerDetailsController.offerDetails[index].isCompleted,
                        title: offerDetailsController.offerDetails[index].title,
                        description: offerDetailsController.offerDetails[index].description,
                        reward: offerDetailsController.offerDetails[index].payoutAmt,
                      );
                    },
                    itemCount: offerDetailsController.offerDetails.length, // Add this line
                  ),
                  largeGap(),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "⚡ $users users have already participated",
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  smallGap(),
                  Row(
                    children: [
                      const Spacer(),
                      myButton("Get Rs. $totalAmount", context),
                      const Spacer(),
                    ],
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }

}

