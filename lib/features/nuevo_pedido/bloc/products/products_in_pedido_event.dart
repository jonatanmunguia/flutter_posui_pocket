part of 'products_in_pedido_bloc.dart';

abstract class ProductsInPedidoEvent extends Equatable {}

class AddProduct extends ProductsInPedidoEvent {
  final ProductModel productModel;

  AddProduct({required this.productModel});

  @override
  List<Object?> get props => [];
}

class RemoveProduct extends ProductsInPedidoEvent {
  final ProductModel productModel;

  RemoveProduct({required this.productModel});

  @override
  List<Object?> get props => [];
}

class CreatePedido extends ProductsInPedidoEvent {

  @override
  List<Object?> get props => [];
}

class ResetState extends ProductsInPedidoEvent {

  ResetState();

  @override
  List<Object?> get props => [];
}
