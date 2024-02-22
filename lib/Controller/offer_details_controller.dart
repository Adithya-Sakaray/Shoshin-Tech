import 'package:get/get.dart';
import 'package:shoshin_app/remote_services/remote_service.dart';

import '../models/offer_details_model.dart';

class OfferDetailsController extends GetxController {
  RxList<OfferDetails> offerDetails = <OfferDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }

  Future<void> fetchDetails() async {
    try {
      final List<OfferDetails> myList = await RemoteService.fetchOfferDetails();
      offerDetails.assignAll(myList);
    } catch (e) {
      print("Error in controller details");
    }

  }
}