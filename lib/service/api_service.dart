import 'package:dio/dio.dart';
import 'package:gocap_app/model/store_model.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://demo4706921.mockable.io" )
  );
  Future<List<StoreModel>> fetchUser() async {
    try {
      Response response = await dio.get("/stores");

      List data = response.data['data'];
      return data.map((e) => StoreModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("failed to load users: $e");
    }
  }
}