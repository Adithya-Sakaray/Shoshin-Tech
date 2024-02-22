import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoshin_app/models/offer_details_model.dart';
import '../models/offer_model.dart';

class RemoteService {
  static Future<List<Offer>> fetchHomeScreenData() async {
    try {
      final response = await http.get(Uri.parse("https://3le9y.wiremockapi.cloud/thing/8"));
      if(response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        List<Offer>  dataList = [];
        for(var jsonItem in jsonList) {
          dataList.add(Offer.fromJson(jsonItem));
        }
        return dataList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  static Future<List<OfferDetails>> fetchOfferDetails() async {
    try {
      final response = await http.get(Uri.parse("https://3le9y.wiremockapi.cloud/json/1"));
      if(response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        List<OfferDetails>  dataList = [];
        for(var jsonItem in jsonList) {
          dataList.add(OfferDetails.fromJson(jsonItem));
        }
        return dataList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}