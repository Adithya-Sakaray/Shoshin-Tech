import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shoshin_app/Controller/home_controller.dart";
import "package:shoshin_app/Screens/all_offers_screen.dart";
import "package:shoshin_app/Screens/gifts_screen.dart";
import "package:shoshin_app/Screens/my_offers_screen.dart";
import "package:shoshin_app/Screens/upcoming_screen.dart";

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final HomeController homeController = Get.find<HomeController>();



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: Padding(
              padding:  const EdgeInsets.symmetric(vertical: 10.0),
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return Text("Hello, ${controller.userName.value}");
                },
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  onPressed: () => homeController.signOutUser(),
                  icon: const Icon(Icons.logout, size: 30),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(75),
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: TabBar(
                      dividerColor: Colors.transparent,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      automaticIndicatorColorAdjustment: true,
                      indicatorWeight: 5.0,
                      tabs: [
                        Tab(
                            text: "All Offers",
                            icon: Icon(Icons.local_offer, color: Theme.of(context).colorScheme.primary,),
                        ),
                        Tab(
                            text: "Gifts",
                            icon: Icon(Icons.wallet_giftcard, color: Theme.of(context).colorScheme.tertiary,)),
                        const Tab(
                            text: "Upcoming",
                            icon: Icon(Icons.watch_later_outlined, color: Colors.amber,)
                        ),
                        const Tab(
                            text: "My Offers",
                            icon: Icon(Icons.check_circle_outline_rounded, color: Colors.deepPurple,)
                        ),
                      ],
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
              ),
        body: const TabBarView(
          children: [
            AllOffersScreen(),
            GiftsScreen(),
            UpcomingScreen(),
            MyOffersScreen(),
          ],
        ),
      ),
    );
  }
}
