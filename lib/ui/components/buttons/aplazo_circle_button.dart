import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoCircleButton extends StatelessWidget {
  const AplazoCircleButton(
      {Key? key, required this.button, required this.onPressButton})
      : super(key: key);
  final CircleButtonProps button;
  final Function(String) onPressButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            onPressButton(button.action);
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 8, vertical: 0)),
            backgroundColor: MaterialStateProperty.all(AppTheme.secondaryColor),
          ),
          child: Image.asset(
            button.imageURl,
            width: 24,
          ),
        ),
        Flexible(
          child: AplazoText(
              textProps:
                  TextProps(text: button.title, type: TextType.microTextBlack)),
        )
      ],
    );
  }
}

class CircleButtonProps {
  final String action;
  final String title;
  final String imageURl;
  CircleButtonProps(
      {required this.imageURl, required this.title, required this.action});
}
