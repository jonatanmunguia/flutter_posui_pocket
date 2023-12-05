import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

import '../../theme/theme_config.dart';

class AplazoInstallmentCard extends StatelessWidget {
  const AplazoInstallmentCard({super.key, required this.installmentCard});
  final InstallmentCardProps installmentCard;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 1,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppTheme.borderColor, //<-- SEE HERE
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              ListTile(
                title: AplazoText(
                    textProps: TextProps(
                        paddingHorizontal: 0,
                        text: 'Status',
                        type: TextType.lightTitle)),
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AplazoText(
                            textProps: TextProps(
                                paddingHorizontal: 0,
                                text: installmentCard.date,
                                type: TextType.headSection)),
                        AplazoText(
                            textProps: TextProps(
                                paddingHorizontal: 0,
                                text: installmentCard.amount,
                                type: TextType.headSection)),
                      ],
                    ),
                    Row(
                      children: [
                        AplazoText(
                            textProps: TextProps(
                                paddingHorizontal: 0,
                                text: installmentCard.numberOfPay.toString(),
                                type: TextType.headSection)),
                        AplazoText(
                            textProps: TextProps(
                                paddingHorizontal: 0,
                                text: installmentCard.creditCard,
                                type: TextType.headSection)),
                      ],
                    )
                  ],
                ),
              ),
              if (installmentCard.type.canPay)
                Row(mainAxisSize: MainAxisSize.max, children: [
                  AplazoButton (
                      buttonProps: ButtonProps(
                          buttonType: ButtonType.primary, text: 'Pagar'),
                      onPressed: () {})
                ])
            ],
          ),
        ));
  }
}

class InstallmentCardProps {
  final String date;
  final String amount;
  final int numberOfPay;
  final int numberOfPayments;
  final String creditCard;
  final InstallmentCardType type;
  const InstallmentCardProps(
      {required this.date,
      required this.amount,
      required this.numberOfPay,
      required this.numberOfPayments,
      required this.creditCard,
      required this.type});
}

enum InstallmentCardType {
  next(canPay: true),
  error(canPay: true),
  historical,
  pending;

  const InstallmentCardType({this.canPay = false});
  final bool canPay;
}
