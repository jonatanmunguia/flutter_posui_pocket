import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class AplazoInfoCard extends StatelessWidget {
  const AplazoInfoCard({Key? key, required this.infoCard}) : super(key: key);
  final InfoCardProps infoCard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 50, child: Image.asset(infoCard.image)),
          const SizedBox(width: 16),
          Expanded(
            child: AplazoText(
                textProps: TextProps(
                    multiAligment: TextAlign.left,
                    text: infoCard.text,
                    type: TextType.cardText,
                    aligment: Alignment.centerLeft)),
          )
        ],
      ),
    );
  }
}

class InfoCardProps {
  final String image;
  final String text;
  const InfoCardProps({required this.image, required this.text});
}
