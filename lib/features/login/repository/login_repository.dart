import 'package:dio/dio.dart';
import 'package:flutter_posui_pocket/features/login/models/LoginResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(String username, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  final Dio client = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  @override
  Future<LoginResponse> login(String username, String password) async {
    try {
      return await client.post('https://merchant-acs.aplazo.dev/api/auth/login',
          data: {
            'username': username,
            'password': password
          }).then((value) => LoginResponse.fromJson(value.data));
    } on DioException {
      rethrow;
    }
  }
}
