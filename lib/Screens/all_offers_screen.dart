import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_app/Controller/all_offers_controller.dart';
import 'package:shoshin_app/Screens/loading_screen.dart';
import 'package:shoshin_app/Screens/offer_details_screen.dart';
import 'package:shoshin_app/utils/gaps.dart';
import 'package:shoshin_app/utils/more_offer_container.dart';
import 'package:shoshin_app/utils/offer_container.dart';

class AllOffersScreen extends StatelessWidget {
  const AllOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllOffersController allOffersController = Get.put(AllOffersController());

     if(allOffersController.allOfferModel.isEmpty) {
      return const LoadingScreen();
    } else {
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "🔥 Trending Offers",
               style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
             ),
             smallGap(),

             // Wrapped the ListView.builder with Expanded
             SizedBox(
               height: 200,
               child: ListView.builder(
                 itemCount: allOffersController.allOfferModel.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) {
                   return GestureDetector(
                     onTap: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (builder) =>
                                   OfferDetailScreen(
                                     title: allOffersController.allOfferModel[index].brand.title,
                                     imageUrl: allOffersController.allOfferModel[index].thumbnail,
                                     description: allOffersController.allOfferModel[index].title,
                                     users: allOffersController.allOfferModel[index].totalLead,
                                     totalAmount: allOffersController.allOfferModel[index].payoutAmt,
                                     appRating: double.parse(allOffersController.allOfferModel[index].customData.appRating),
                                   )
                           )
                       );
                     },
                     child: OfferContainer(
                       title: allOffersController.allOfferModel[index].brand
                           .title,
                       url: allOffersController.allOfferModel[index].thumbnail,
                       price: allOffersController.allOfferModel[index].payoutAmt,
                       users: allOffersController.allOfferModel[index].totalLead,
                     ),
                   );
                 },
               ),
             ),

             smallGap(),
             Text(
               "📈 More Offers",
               style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
             ),
             smallGap(),

             // Wrapped the ListView.builder with Expanded
             Expanded(
               child: ListView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: allOffersController.allOfferModel.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(
                     onTap: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (builder) =>
                                   OfferDetailScreen(
                                       title: allOffersController.allOfferModel[index].brand.title,
                                       imageUrl: allOffersController.allOfferModel[index].thumbnail,
                                       description: allOffersController.allOfferModel[index].title,
                                       users: allOffersController.allOfferModel[index].totalLead,
                                       totalAmount: allOffersController.allOfferModel[index].payoutAmt,
                                       appRating: double.parse(allOffersController.allOfferModel[index].customData.appRating),
                                   )
                           )
                       );
                     },
                     child: MoreOfferContainer(
                       imageUrl: allOffersController.allOfferModel[index]
                           .thumbnail,
                       title: allOffersController.allOfferModel[index].brand
                           .title,
                       rewardPrice: allOffersController.allOfferModel[index]
                           .payoutAmt,
                       users: allOffersController.allOfferModel[index].totalLead,
                       colorString:
                       allOffersController.allOfferModel[index].customData
                           .dominantColor,
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
       );
     }
  }
}
