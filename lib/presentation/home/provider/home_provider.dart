import 'package:flutter/material.dart';
import 'package:gocap_app/model/store_model.dart';
import 'package:gocap_app/service/api_service.dart';

class HomeProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  List<StoreModel> stores = [];
  bool isLoading = false;
  String? erorMessage;

  Future<void> getStores() async {
    isLoading = true;
    notifyListeners();

    try {
      stores = await _apiService.fetchUser();
      erorMessage = null;
    } catch (e) {
      erorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}