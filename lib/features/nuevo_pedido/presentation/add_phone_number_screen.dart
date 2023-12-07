import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/bloc/phone_number/phone_number_bloc.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/products_in_pedido_screen.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class AddPhoneNumberScreen extends StatelessWidget {
  const AddPhoneNumberScreen({super.key});

  static const idScreen = 'AddPhoneNumber_screen';

  @override
  Widget build(BuildContext context) {
    return const AddPhoneNumberBody();
  }
}

class AddPhoneNumberBody extends StatelessWidget {
  const AddPhoneNumberBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => PhoneNumberBloc())],
        child: BlocConsumer<PhoneNumberBloc, PhoneNumberState>(
            builder: (context, state) => Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
            ),
            AplazoText(
                textProps: TextProps(
                    text: 'Ingresa el teléfono del cliente',
                    type: TextType.headlineSize24Weight700)),
            const SizedBox(
              height: 16,
            ),
            AplazoTextField(
                textFieldProps: TextFieldProps(
                    textFieldType: TextFieldType.phone,
                    hintText: '5512345678',
                    label: 'Celular del cliente'),
                onChanged: (string) {},
                controller: phoneController),
            const Spacer(),
            AplazoButton(
                buttonProps: ButtonProps(
                    text: 'Continuar', buttonType: ButtonType.primary),
                onPressed: () {
                              BlocProvider.of<PhoneNumberBloc>(context).add(
                                  SaveUserPhoneNumber(
                                      userPhoneNumber: phoneController.text));
                            }),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Pedido nuevo'),
      ),
                ),
            listener: (context, state) {
              if (state is MoveToNextScreen) {
                context.materialPush(screen: const ProductsInPedidoScreen());
                BlocProvider.of<PhoneNumberBloc>(context).add(RestartState());
              }
            }));
  }
}
