import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoshin_app/utils/gaps.dart';
import 'package:shoshin_app/utils/more_offer_container.dart';
import 'package:shoshin_app/utils/offer_container.dart';

class AllOffersScreen extends StatelessWidget {
  const AllOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Text("🔥 Trending Offers", style: TextStyle(color: Colors.grey.shade700, fontSize: 16),),
        
            smallGap(),
        
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OfferContainer(
                      title: "Alto's Odysseykgg dvfvf",
                      url: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                      price: 200,
                      users: 400),
                  OfferContainer(
                      title: "Alto's Odyssey",
                      url: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                      price: 200,
                      users: 400),
                  OfferContainer(
                      title: "Alto's Odyssey",
                      url: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                      price: 200,
                      users: 400),
                ],
              ),
            ),
        
            smallGap(),
        
            Text("📈 More Offers", style: TextStyle(color: Colors.grey.shade700, fontSize: 16)),
        
            smallGap(),
        
            MoreOfferContainer(
                imageUrl: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                title: "Alto's Odyssey",
                rewardPrice: 200,
                users: 4000
            ),MoreOfferContainer(
                imageUrl: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                title: "Alto's Odyssey",
                rewardPrice: 200,
                users: 4000
            ),MoreOfferContainer(
                imageUrl: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                title: "Alto's Odyssey",
                rewardPrice: 200,
                users: 4000
            ),MoreOfferContainer(
                imageUrl: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                title: "Alto's Odyssey",
                rewardPrice: 200,
                users: 4000
            ),MoreOfferContainer(
                imageUrl: "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
                title: "Alto's Odyssey",
                rewardPrice: 200,
                users: 4000
            ),
        
        
          ],
        ),
      ),
    );
  }
}
