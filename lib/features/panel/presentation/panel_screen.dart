import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/add_phone_number_screen.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';

class PanelScreen extends StatelessWidget {
  const PanelScreen({super.key});

  static const idScreen = 'Panel_screen';

  @override
  Widget build(BuildContext context) {
    return const PanelBody();
  }
}

class PanelBody extends StatelessWidget {
  const PanelBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
              ),
            ),
          ),
          AplazoButton(
              buttonProps: ButtonProps(
                  text: 'Nuevo pedido', buttonType: ButtonType.primary),
              onPressed: () {
                context.materialPush(screen: const AddPhoneNumberScreen());
              }),
        ],
      ),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Panel'),
      ),
    );
  }
}
