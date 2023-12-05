import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoTextFieldDate extends StatelessWidget {
  const AplazoTextFieldDate(
      {super.key,
      required this.onPressed,
      required this.value,
      required this.label,
      this.verticalPadding = 4});
  final String label;
  final Function onPressed;
  final String value;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppTheme.sizePadding, vertical: verticalPadding),
        child: Column(children: [
          AplazoText(
            textProps: TextProps(
                aligment: Alignment.centerLeft,
                text: label,
                paddingHorizontal: 4,
                paddingVertical: 0,
                type: TextType.smallText),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              style: _getButtonStyle(),
              onPressed: () {
                onPressed();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AplazoText(
                    textProps: TextProps(
                        paddingVertical: 16,
                        text: value.isEmpty ? 'Selecciona una fecha' : value,
                        type:
                            value.isEmpty ? TextType.smallText : TextType.text),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ))
        ]));
  }
}

ButtonStyle _getButtonStyle() {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),
    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.secondaryColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(color: AppTheme.borderColor))),
  );
}
