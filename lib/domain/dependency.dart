import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeDependencies() async {
  GetIt.instance
    ..registerSingleton<Dio>(Dio());
}
