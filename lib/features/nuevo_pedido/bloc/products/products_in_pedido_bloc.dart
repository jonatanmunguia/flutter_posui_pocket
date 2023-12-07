import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_posui_pocket/core/preferences_keys.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/model/ProductModel.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/repository/nuevo_pedido_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'products_in_pedido_event.dart';

part 'products_in_pedido_state.dart';

class ProductsInPedidoBloc
    extends Bloc<ProductsInPedidoEvent, ProductsInPedidoState> {
  final List<ProductModel> listProduct = [];
  int totalPrice = 0;
  final NuevoPedidoRepository nuevoPedidoRepository =
      NuevoPedidoRepositoryImpl();

  ProductsInPedidoBloc() : super(ProductsInPedidoInitial()) {
    on<ProductsInPedidoEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is AddProduct) {
        listProduct.add(event.productModel);
        checkProductList();
      }

      if (event is RemoveProduct) {
        listProduct.remove(event.productModel);
        checkProductList();
      }

      if (event is CreatePedido) {
        emit(CreatePedidoLoading());
        final result =
            await nuevoPedidoRepository.addNewPedido(listProduct, totalPrice);
        prefs.setInt(PreferencesKeys.loanId, result.loanId ?? 0);
        emit(MoveToSuccessPedido());
      }

      if (event is ResetState) {
        emit(ProductsInPedidoInitial());
      }
    });
  }

  checkProductList() {
    if (listProduct.isEmpty) {
      emit(NotHasProduct());
    } else {
      var totalQuantity = listProduct.fold(
          0, (sum, item) => sum + ((item.price ?? 0) * (item.count ?? 1)));
      totalPrice = totalQuantity;
      emit(HasProductInCart(
          listProducts: listProduct, totalQuantity: totalQuantity.toDouble()));
    }
  }
}
