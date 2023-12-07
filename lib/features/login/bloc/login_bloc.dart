import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_posui_pocket/features/login/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository repository = LoginRepositoryImpl();


  LoginBloc() : super(LoginInitial()) {
   init();
  }

  init() {
    addListener();
  }

  addListener() {
    on<LoginEvent>((event, emit) async {

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is UserLoginEvent) {
        emit(LoginLoading());
        try {
          final result = await repository.login(/*event.user*/'withEmailTestuser4', /*event.password*/'Aplazo@123');
          if (result.content?.token != null) {
            prefs.setString('user_token', result.content!.token!);
            emit(UserLogged());
          } else {
            emit(LoginError());
          }
        } on DioException {
          emit(LoginError());
        }

      }


    });
  }
}
