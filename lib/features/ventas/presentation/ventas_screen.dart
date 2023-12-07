import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/nuevo_pedido/presentation/add_phone_number_screen.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_agent_progress_card.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_text_number_text_card.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_container_card.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class VentasScreen extends StatelessWidget {
  const VentasScreen({super.key});

  static const idScreen = 'Panel_screen';

  @override
  Widget build(BuildContext context) {
    return const VentasBody();
  }
}

class VentasBody extends StatelessWidget {
  const VentasBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AplazoAgentProgressCard(),
                  const AplazoTextNumberTextCard(text1: 'Realizas en promedio',
                      number: '50', text2: 'Ventas al día cobrando con Aplazo', color: Color(0xFFB5ACF2)),
                  const AplazoTextNumberTextCard(text1: 'Has realizado',
                      number: '750', text2: 'Ventas cobrando con Aplazo', color: Color(0xFFF0AA6A)),
                  AplazoContainerCard(childrenContent: [
                    AplazoText(
                        textProps: TextProps(
                            text: 'Realiza 10 ventas con Aplazo',
                            type: TextType.headlineSize16Weight600Black)),
                    const SizedBox(
                      height: 6,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/img_lavadora.png',
                        // Reemplaza con la ruta de tu imagen
                        width: 175.0,
                        height: 116.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    AplazoText(
                        textProps: TextProps(
                            text: 'Vende a 10 clientes entre el 20 de enero y el 10 de febrero de 2024 y ¡gánate una lavadora LG!',
                            type: TextType.headlineSize14Weight400Black)),
                  ], color: const Color(0xFF00E6F5)),
                ],
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
        navbarProps: NavbarProps(title: 'Ventas'),
      ),
    );
  }
}
