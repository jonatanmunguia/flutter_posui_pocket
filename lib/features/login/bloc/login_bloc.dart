import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_posui_pocket/features/login/repository/login_repository.dart';

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

      if (event is UserLoginEvent) {
        emit(LoginLoading());
        final result = await repository.login(event.user, event.password);

      }


    });
  }
}
