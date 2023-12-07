part of 'products_in_pedido_bloc.dart';

abstract class ProductsInPedidoState extends Equatable {}

class ProductsInPedidoInitial extends ProductsInPedidoState {
  @override
  List<Object?> get props => [];
}

class CreatePedidoLoading extends ProductsInPedidoState {
  @override
  List<Object?> get props => [];
}

class MoveToSuccessPedido extends ProductsInPedidoState {
  @override
  List<Object?> get props => [];
}


class NotHasProduct extends ProductsInPedidoState {
  @override
  List<Object?> get props => [];
}

class HasProductInCart extends ProductsInPedidoState {

  final List<ProductModel> listProducts;

  final double totalQuantity;

  HasProductInCart({required this.listProducts, required this.totalQuantity});

  @override
  List<Object?> get props => [];
}
