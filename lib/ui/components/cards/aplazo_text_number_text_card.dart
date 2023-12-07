import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/components/cards/aplazo_container_card.dart';

class AplazoTextNumberTextCard extends StatelessWidget {
  const AplazoTextNumberTextCard({super.key, required this.text1, required this.number, required this.text2, required this.color});

  final String text1;
  final String number;
  final String text2;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AplazoContainerCard(childrenContent: [
      AplazoText(
          textProps: TextProps(
              aligment: Alignment.topLeft,
              multiAligment: TextAlign.left,
              text: text1,
              type: TextType.headlineSize16Weight400White)),
      AplazoText(
          textProps: TextProps(
              aligment: Alignment.topLeft,
              multiAligment: TextAlign.left,
              text: number,
              type: TextType.headlineSize32Weight800White)),
      AplazoText(
          textProps: TextProps(
              aligment: Alignment.topLeft,
              multiAligment: TextAlign.left,
              text: text2,
              type: TextType.headlineSize16Weight400White)),
    ], color: color);
  }
}
