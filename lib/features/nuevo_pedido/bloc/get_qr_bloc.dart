import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_posui_pocket/core/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/nuevo_pedido_repository.dart';

part 'get_qr_event.dart';

part 'get_qr_state.dart';

class GetQrBloc extends Bloc<GetQrEvent, GetQrState> {
  final NuevoPedidoRepository nuevoPedidoRepository =
      NuevoPedidoRepositoryImpl();

  GetQrBloc() : super(GetQrInitial()) {
    init();
  }

  init() {
    addObservables();
    add(GetQrImage());
  }

  addObservables() {
    on<GetQrEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is GetQrImage) {
        final result = await nuevoPedidoRepository
            .getQr(prefs.getInt(PreferencesKeys.loanId) ?? 0);
        emit(GetQrImageLoaded(imageInBase64: result.base64 ?? ''));
      }
    });
  }
}
