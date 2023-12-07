import 'package:dio/dio.dart';
import 'package:flutter_posui_pocket/core/preferences_keys.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/model/NewPedidoResponse.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/model/NuevoPedidoRequest.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/model/QRResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../model/ProductModel.dart';

abstract class NuevoPedidoRepository {
  Future<NewPedidoResponse> addNewPedido(
      List<ProductModel> listProduct, int totalPrice);

  Future<QrResponse> getQr(int loanId);
}

class NuevoPedidoRepositoryImpl extends NuevoPedidoRepository {
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
  Future<NewPedidoResponse> addNewPedido(
      List<ProductModel> listProduct, int totalPrice) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await client
        .post('https://pos.aplazo.dev/api/orders',
            options: Options(headers: {
              'Authorization': '${prefs.getString(PreferencesKeys.tokenKey)}',
              'Origin': 'https://posui.aplazo.dev',
              'X-Selected-Branch': '47',
            }),
            data: NuevoPedidoRequest(
                    cartId: const Uuid().v1(),
                    discount: Discount(title: 'sin descuento', price: 0),
                    shipping: Shipping(title: 'Recoger en tienda', price: 0),
                    successUrl: 'https://posui.aplazo.dev/success?branchId=47',
                    errorUrl:
                        'https://posui.aplazo.dev/secured/error-page?branchId=47',
                    webHookUrl: 'THIS WILL BE OVVERRIDED BY BACKEND',
                    sellsAgentId: 0,
                    totalPrice: totalPrice,
                    taxes: Taxes(price: 16, title: 'IVA'),
                    products: listProduct)
                .toJson())
        .then((response) => NewPedidoResponse.fromJson(response.data));
  }

  @override
  Future<QrResponse> getQr(int loanId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await client.get('https://pos.aplazo.dev/api/orders/qr-image?loanId=${loanId}',
        options: Options(headers: {
          'Authorization': '${prefs.getString(PreferencesKeys.tokenKey)}',
          'Origin': 'https://posui.aplazo.dev',
          'X-Selected-Branch': '47',
        }),).then((value) => QrResponse.fromJson(value.data));
  }
}
