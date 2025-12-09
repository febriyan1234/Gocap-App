import 'dart:math';

import 'package:dio/dio.dart';
import 'package:gocap_app/model/payment_model.dart';
import 'package:gocap_app/model/food_model.dart';
import 'package:gocap_app/model/promo_model.dart';
import 'package:gocap_app/model/store_model.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://demo4706921.mockable.io" )
  );
  Future<List<StoreModel>> fetchStore() async {
    try {
      Response response = await dio.get("/stores");

      List data = response.data['data'];
      return data.map((e) => StoreModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("failed to load users: $e");
    }
  }
  Future<List<PaymentModel>> fetchPayment() async {
    try {
      Response response = await dio.get("/payments");

      List data = response.data['data'];
      return data.map((e) => PaymentModel.fromJson(e)).toList();
    }catch (e) {
      throw Exception("failed to load users: $e");
    }
  }
  Future<List<PromoModel>> fetchPromo() async {
    try {
      Response response = await dio.get('/promos');

      List data = response.data['data'];
      return data.map((e) => PromoModel.fromJson(e)).toList();
    }catch (e) {
      throw Exception("failed to load users: $e");
    }
  }
  Future<List<FoodModel>> fetchFood() async {
    try {
      Response response = await dio.get('/foods');

      List data = response.data['data'];
      return data.map((e) => FoodModel.fromJson(e)).toList();
    }catch (e) {
      throw Exception("failed to load users: $e");
    }
  }
}