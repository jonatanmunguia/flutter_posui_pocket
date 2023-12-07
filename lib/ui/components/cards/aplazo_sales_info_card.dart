import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AplazoSalesInfoCard extends StatelessWidget {
  const AplazoSalesInfoCard({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AplazoText(
                textProps: TextProps(
                    multiAligment: TextAlign.left,
                    text: text1,
                    type: TextType.headlineSize32Weight700Black)),
            SvgPicture.asset(
              'assets/images/ic_question.svg',
              width: 48.0,
              height: 48.0,
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        AplazoText(
            textProps: TextProps(
                multiAligment: TextAlign.left,
                aligment: Alignment.centerLeft,
                text: text2,
                type: TextType.headlineSize16Weight600Black)),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
