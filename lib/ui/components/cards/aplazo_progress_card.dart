import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

import '../../theme/theme_config.dart';

class AplazoProgressCard extends StatelessWidget {
  const AplazoProgressCard(
      {Key? key, required this.progressCard, required this.onTapCreditCard})
      : super(key: key);
  final ProgressCardProps progressCard;
  final Function() onTapCreditCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCreditCard,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          padding: const EdgeInsets.all(8),
          height: 100,
          decoration: const BoxDecoration(
              color: AppTheme.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AplazoText(
                          textProps: TextProps(
                              text: progressCard.title,
                              type: TextType.homeCredit,
                              paddingHorizontal: 0,
                              aligment: Alignment.centerLeft)),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          AplazoText(
                              textProps: TextProps(
                                  text: progressCard.highText,
                                  type: TextType.homeName,
                                  paddingHorizontal: 0)),
                          AplazoText(
                              textProps: TextProps(
                                  text: progressCard.normalText,
                                  type: TextType.homeSmall,
                                  paddingHorizontal: 0))
                        ],
                      ),
                    ],
                  )),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: progressCard.value,
                  minHeight: 10,
                  color: AppTheme.highColor,
                  backgroundColor: AppTheme.borderColor,
                ),
              )
              /*Container(
              height: 10,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppTheme.borderColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(10))),
              child: Container(
                  decoration: const BoxDecoration(
                      color: AppTheme.highColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)))),
            ),*/
            ],
          )),
    );
  }
}

class ProgressCardProps {
  final String title;
  final String highText;
  final String normalText;
  double value;

  ProgressCardProps(
      {required this.title,
      required this.highText,
      required this.normalText,
      required this.value});
}
