import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/bloc/products/products_in_pedido_bloc.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/model/ProductModel.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/success_pedido_screen.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_posui_pocket/ui/components/loaders/aplazo_loader.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/extensions/aplazo_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsInPedidoScreen extends StatefulWidget {
  const ProductsInPedidoScreen({super.key});

  @override
  State<ProductsInPedidoScreen> createState() => _ProductsInPedidoScreenState();
}

class _ProductsInPedidoScreenState extends State<ProductsInPedidoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => ProductsInPedidoBloc())],
          child: BlocConsumer<ProductsInPedidoBloc, ProductsInPedidoState>(
              builder: (context, state) {
                if (state is HasProductInCart) {
                  return ordersList(
                      state.listProducts, state.totalQuantity.toInt(), context);
                } else if (state is ProductsInPedidoInitial) {
                  return emptyState(context);
                } else {
                  return AplazoLoader();
                }
              },
              listener: (context, state) {
                if (state is MoveToSuccessPedido) {
                  context.materialPush(screen: SuccessPedidoScreen());
                }
              })),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Pedido nuevo'),
      ),
    );
  }

  Widget ordersList(List<ProductModel> listProducts, int totalToPayment,
      BuildContext contextToProvider) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        AplazoText(
            textProps: TextProps(
                text: 'Productos', type: TextType.headlineSize24Weight700)),
        Expanded(
            child: ListView.builder(
                itemCount: listProducts.length,
                itemBuilder: (context, index) =>
                    rowProduct(listProducts[index]))),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      AplazoText(
                          textProps: TextProps(
                              text: 'Total a pagar',
                              type: TextType.headlineSize12Weight600Semibold)),
                      const Spacer(),
                      AplazoText(
                          textProps: TextProps(
                              text: '\$${totalToPayment}',
                              type: TextType.headlineSize12Weight400)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      AplazoText(
                          textProps: TextProps(
                              text: 'Asesor de ventas',
                              type: TextType.headlineSize12Weight600Semibold)),
                      const Spacer(),
                      AplazoText(
                          textProps: TextProps(
                              text: '834508',
                              type: TextType.headlineSize12Weight400)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        AplazoButton(
            buttonProps: ButtonProps(
                text: 'AGREGAR MÁS PRODUCTOS',
                buttonType: ButtonType.secondary),
            onPressed: () {
              BlocProvider.of<ProductsInPedidoBloc>(contextToProvider)
                  .add(ResetState());
              showAddProductDialog(contextToProvider);
            }),
        const SizedBox(
          height: 16,
        ),
        AplazoButton(
            buttonProps: ButtonProps(
                text: 'Procesar orden', buttonType: ButtonType.primary),
            onPressed: () {
              BlocProvider.of<ProductsInPedidoBloc>(contextToProvider)
                  .add(CreatePedido());
            }),
        const SizedBox(height: 32)
      ],
    );
  }

  Widget rowProduct(ProductModel productModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                  Spacer(),
                  Icon(Icons.edit_outlined)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  AplazoText(
                      textProps: TextProps(
                          text: 'Producto',
                          type: TextType.headlineSize12Weight600Semibold)),
                  const Spacer(),
                  AplazoText(
                      textProps: TextProps(
                          text: '${productModel.title}',
                          type: TextType.headlineSize12Weight400)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  AplazoText(
                      textProps: TextProps(
                          text: 'SKU',
                          type: TextType.headlineSize12Weight600Semibold)),
                  const Spacer(),
                  AplazoText(
                      textProps: TextProps(
                          text: '${productModel.externalId}',
                          type: TextType.headlineSize12Weight400)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  AplazoText(
                      textProps: TextProps(
                          text: 'Cantidad',
                          type: TextType.headlineSize12Weight600Semibold)),
                  const Spacer(),
                  AplazoText(
                      textProps: TextProps(
                          text: '${productModel.count}',
                          type: TextType.headlineSize12Weight400)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  AplazoText(
                      textProps: TextProps(
                          text: 'Precio',
                          type: TextType.headlineSize12Weight600Semibold)),
                  const Spacer(),
                  AplazoText(
                      textProps: TextProps(
                          text: '\$${productModel.price}',
                          type: TextType.headlineSize12Weight400)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyState(BuildContext contextProvider) {
    return Column(
      children: [
        const Spacer(),
        SvgPicture.asset('assets/images/ic_no_products.svg'),
        const Spacer(),
        AplazoText(
            textProps: TextProps(
                text: 'Empieza agregando productos.',
                type: TextType.headlineSize16Weight700)),
        const Spacer(),
        AplazoButton(
            buttonProps: ButtonProps(
                text: 'Añadir producto', buttonType: ButtonType.primary),
            onPressed: () {
              showAddProductDialog(contextProvider);
            }),
        const Spacer(),
        const Spacer(),
        const Spacer()
      ],
    );
  }

  void showAddProductDialog(BuildContext productProvider) {
    final TextEditingController skuController = TextEditingController();
    final TextEditingController productController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16),
                        child: IconButton(
                            onPressed: () {
                              context.back();
                            },
                            icon: const Icon(Icons.close)),
                      )
                    ],
                  ),
                  AplazoText(
                      textProps: TextProps(
                          text: 'Añadir Producto',
                          type: TextType.headlineSize24Weight700)),
                  SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: 'SKU',
                          label: 'ID Producto',
                          textFieldType: TextFieldType.normal),
                      onChanged: (string) {},
                      controller: skuController),
                  SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: 'Nombre del producto',
                          label: 'Producto',
                          textFieldType: TextFieldType.normal),
                      onChanged: (string) {},
                      controller: productController),
                  SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: 'Cantidad',
                          label: 'Cantidad',
                          textFieldType: TextFieldType.normal),
                      onChanged: (string) {},
                      controller: quantityController),
                  SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: '\$0.00',
                          label: 'Precio',
                          textFieldType: TextFieldType.number),
                      onChanged: (string) {},
                      controller: priceController),
                  SizedBox(
                    height: 16,
                  ),
                  AplazoButton(
                      buttonProps: ButtonProps(
                          text: 'Añadir producto',
                          buttonType: ButtonType.primary),
                      onPressed: () {
                        BlocProvider.of<ProductsInPedidoBloc>(productProvider)
                            .add(AddProduct(
                                productModel: ProductModel(
                                    title: productController.text,
                                    imageUrl: '',
                                    description: '',
                                    externalId: skuController.text,
                                    price: priceController.text.convertToInt(),
                                    count: quantityController.text
                                        .convertToInt())));
                        context.back();
                      })
                ],
              ),
            ),
          );
        });
  }
}
