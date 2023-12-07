import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class AplazoAgentProgressCard extends StatelessWidget {
  const AplazoAgentProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color(0xFF5FC7A4),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AplazoText(
                          textProps: TextProps(
                              multiAligment: TextAlign.left,
                              text: 'Eres el número 1 vendiendo con Aplazo en tu tienda',
                              type: TextType.headlineSize18Weight600White)),
                      const SizedBox(
                        height: 14,
                      ),
                      AplazoText(
                          textProps: TextProps(
                              multiAligment: TextAlign.left,
                              text: 'Has vendido 47% más en Aplazo que el resto de los vendedores de tu tienda.',
                              type: TextType.headlineSize16Weight400White)),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                // Agrega un espacio entre el texto y la imagen
                Image.asset(
                  'assets/images/badge1.png',
                  // Reemplaza con la ruta de tu imagen
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            LinearProgressIndicator(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.32),
              minHeight: 10,
              value: 0.6,
              borderRadius: BorderRadius.circular(10.0),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              AplazoText(
                  textProps: TextProps(
                      text: 'Nivel verde',
                      type: TextType.headlineSize16Weight400White)),
              AplazoText(
                  textProps: TextProps(
                      text: 'Nivel aqua',
                      type: TextType.headlineSize16Weight400White)),
            ])
          ],
        ),
      ),
    );
  }
}
