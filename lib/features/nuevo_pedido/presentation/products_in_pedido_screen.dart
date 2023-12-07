import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsInPedidoScreen extends StatefulWidget {
  const ProductsInPedidoScreen({super.key});

  @override
  State<ProductsInPedidoScreen> createState() => _ProductsInPedidoScreenState();
}

class _ProductsInPedidoScreenState extends State<ProductsInPedidoScreen> {
  final TextEditingController skuController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          SvgPicture.asset('assets/images/ic_no_products.svg'),
          Spacer(),
          AplazoText(
              textProps: TextProps(
                  text: 'Empieza agregando productos.',
                  type: TextType.headlineSize16Weight700)),
          Spacer(),
          AplazoButton(
              buttonProps: ButtonProps(
                  text: 'Añadir producto', buttonType: ButtonType.primary),
              onPressed: () {
                showAddProductDialog();
              }),
          Spacer(),
          Spacer(),
          Spacer()
        ],
      ),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Pedido nuevo'),
      ),
    );
  }

  void showAddProductDialog() {
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
                      onPressed: () {})
                ],
              ),
            ),
          );
        });
  }
}
