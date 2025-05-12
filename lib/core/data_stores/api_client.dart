import 'package:dio/dio.dart';

class ApiClient {
  final client = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      contentType: 'application/json',
    ),
  );
}
