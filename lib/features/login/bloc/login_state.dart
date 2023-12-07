part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class UserLogged extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  @override
  List<Object> get props => [];
}
