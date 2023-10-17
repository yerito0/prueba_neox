import 'package:dio/dio.dart';

//Agrega clase que permite utilización de Dio por medio de clase
class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }
  Dio get sendRequest => _dio;
}
