import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class Network {
  static Future<List<dynamic>> getEuropeCountries() async {
    try {
      final responce = await GetIt.I<Dio>()
          .get('https://restcountries.eu/rest/v2/region/europe');
      return responce.data;
    } catch (e) {
      rethrow;
    }
  }
}
