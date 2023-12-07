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
      body: ordersList(),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Pedido nuevo'),
      ),
    );
  }

  Widget ordersList() {
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
                itemCount: 10, itemBuilder: (context, index) => rowProduct())),
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
                              text: '\$12,940.00',
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
              showAddProductDialog();
            }),
        const SizedBox(
          height: 16,
        ),
        AplazoButton(
            buttonProps: ButtonProps(
                text: 'Procesar orden', buttonType: ButtonType.primary),
            onPressed: () {}),
        const SizedBox(height: 32)
      ],
    );
  }

  Widget rowProduct() {
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
                          text: 'Zapatilla Swift Run 22',
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
                          text: '22DRTYHDFSG',
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
                          text: '1', type: TextType.headlineSize12Weight400)),
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
                          text: '\$2,940.00',
                          type: TextType.headlineSize12Weight400)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyState() {
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
              showAddProductDialog();
            }),
        const Spacer(),
        const Spacer(),
        const Spacer()
      ],
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
                      const Spacer(),
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
                  const SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: 'SKU',
                          label: 'ID Producto',
                          textFieldType: TextFieldType.normal),
                      onChanged: (string) {},
                      controller: skuController),
                  const SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: 'Nombre del producto',
                          label: 'Producto',
                          textFieldType: TextFieldType.normal),
                      onChanged: (string) {},
                      controller: productController),
                  const SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: 'Cantidad',
                          label: 'Cantidad',
                          textFieldType: TextFieldType.normal),
                      onChanged: (string) {},
                      controller: quantityController),
                  const SizedBox(
                    height: 16,
                  ),
                  AplazoTextField(
                      textFieldProps: TextFieldProps(
                          hintText: '\$0.00',
                          label: 'Precio',
                          textFieldType: TextFieldType.number),
                      onChanged: (string) {},
                      controller: priceController),
                  const SizedBox(
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
