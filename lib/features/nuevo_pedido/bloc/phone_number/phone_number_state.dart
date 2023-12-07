part of 'phone_number_bloc.dart';

abstract class PhoneNumberState extends Equatable {
  const PhoneNumberState();
}

class PhoneNumberInitial extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class MoveToNextScreen extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

