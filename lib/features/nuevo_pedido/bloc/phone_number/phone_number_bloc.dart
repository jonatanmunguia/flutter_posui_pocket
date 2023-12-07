import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_posui_pocket/core/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'phone_number_event.dart';

part 'phone_number_state.dart';

class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneNumberState> {
  PhoneNumberBloc() : super(PhoneNumberInitial()) {
    on<PhoneNumberEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is SaveUserPhoneNumber) {
        prefs.setString(PreferencesKeys.userPhoneNumber, event.userPhoneNumber);
        emit(MoveToNextScreen());
      }

      if (event is RestartState) {
        emit(PhoneNumberInitial());
      }
    });
  }
}
