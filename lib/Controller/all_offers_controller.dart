
import 'package:get/get.dart';
import 'package:shoshin_app/models/offer_model.dart';
import 'package:shoshin_app/remote_services/remote_service.dart';

class AllOffersController extends GetxController {
  RxList<Offer> allOfferModel = <Offer>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData(); // Call fetchData when HomeController is initialized
  }

  Future<void> fetchHomeData() async {
    try {
      final List<Offer> myList = await RemoteService.fetchHomeScreenData();
      allOfferModel.assignAll(myList);
    }
    catch (e) {
      print("Error occured in controller 1");
    }
  }

}