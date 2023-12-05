import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoActionCard extends StatelessWidget {
  const AplazoActionCard({super.key, required this.actionCard});

  final ActionCardProps actionCard;

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
                        text: actionCard.title,
                        type: TextType.lightTitle)),
                subtitle: AplazoText(
                    textProps: TextProps(
                        paddingHorizontal: 0,
                        text: actionCard.subtitle,
                        type: TextType.text)),
              ),
              Row(children: [
                AplazoButton(
                    buttonProps: ButtonProps(
                        buttonType: ButtonType.primary,
                        text: actionCard.buttonTitle),
                    onPressed: () {})
              ])
            ],
          ),
        ));
  }
}

class ActionCardProps {
  final String title;
  final String subtitle;
  final String buttonTitle;

  const ActionCardProps(
      {required this.title, required this.subtitle, required this.buttonTitle});
}
