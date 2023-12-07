part of 'phone_number_bloc.dart';

abstract class PhoneNumberEvent extends Equatable {
  const PhoneNumberEvent();
}

class SaveUserPhoneNumber extends PhoneNumberEvent {
  final String userPhoneNumber;

  const SaveUserPhoneNumber({required this.userPhoneNumber});

  @override
  List<Object?> get props => [];
}

class RestartState extends PhoneNumberEvent {
  @override
  List<Object?> get props => [];

}
