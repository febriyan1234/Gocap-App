import 'package:flutter/material.dart';
import 'package:gocap_app/model/food_model.dart';
import 'package:gocap_app/model/payment_model.dart';
import 'package:gocap_app/model/promo_model.dart';
import 'package:gocap_app/model/store_model.dart';
import 'package:gocap_app/service/api_service.dart';

class HomeProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  List<StoreModel> stores = [];
  List<PaymentModel> payments = [];
  List<PromoModel> promos = [];
  List<FoodModel> foods = [];
  bool isLoading = false;
  String? erorMessage;

  Future<void> loadHomeData() async {
  isLoading = true;
  notifyListeners();
  

  try {
    final results = await Future.wait([
      _apiService.fetchStore(),
      _apiService.fetchPayment(),
      _apiService.fetchPromo(),
      _apiService.fetchFood(),
    ]);

    stores = results[0] as List<StoreModel>;
    payments = results[1] as List<PaymentModel>;
    promos = results[2] as List<PromoModel>;
    foods = results[3] as List<FoodModel>;
    erorMessage = null;
  } catch (e) {
    erorMessage = e.toString();
  }

  isLoading = false;
  notifyListeners();
}

}