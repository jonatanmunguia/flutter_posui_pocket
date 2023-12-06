import 'package:dio/dio.dart';

abstract class LoginRepository {
  Future<void> login(String email, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  final Dio client = Dio();

  @override
  Future<void> login(String email, String password) async {
    final result = await client.get('https://api.aplazo.dev/login',
        data: {'login': email, 'password': password});

    
  }
}
