part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserLoginEvent extends LoginEvent {
  final String user;
  final String password;

  const UserLoginEvent({required this.user, required this.password});

  @override
  List<Object?> get props => [];
}
