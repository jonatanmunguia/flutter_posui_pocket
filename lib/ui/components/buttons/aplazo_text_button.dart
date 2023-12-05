import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoTextButton extends StatelessWidget {
  final TextButtonProps textButtonProps;
  final Function() onPressButton;

  const AplazoTextButton(
      {Key? key, required this.textButtonProps, required this.onPressButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: textButtonProps.aligment,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: textButtonProps.paddingHorizontal,
              vertical: textButtonProps.paddingVertical),
          child: Row(
            mainAxisAlignment: textButtonProps.centerInRow ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: onPressButton,
                child: Text(textButtonProps.text,
                    style: _getStyle(textButtonProps.type),
                    textAlign: TextAlign.center,
                    overflow: textButtonProps.limitOneLine
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible),
              ),
              Visibility(
                  visible: textButtonProps.icon != null,
                  child: textButtonProps.icon ?? const Icon(Icons.error, size: 12.0,))
            ],
          )),
    );
  }
}

TextStyle _getStyle(TextButtonType text) {
  return TextStyle(
      color: text.color,
      fontSize: text.size,
      fontWeight: text.fontWeight,
      fontFamily: 'Manrope');
  //decoration: text.decoration);
}

enum TextButtonType {
  text(AppTheme.sizeTextFont, AppTheme.textButtonColor, FontWeight.bold),
  textButton(AppTheme.sizeTextFont, AppTheme.primaryColor, FontWeight.bold);

  const TextButtonType(
    this.size,
    this.color,
    this.fontWeight,
    /*{this.fontFamily = 'Manrope', this.decoration = TextDecoration.none}*/
  );

  final double size;
  final Color color;
  final FontWeight fontWeight;
  //final String fontFamily;
  //final TextDecoration decoration;
}

class TextButtonProps {
  final double paddingHorizontal;
  final double paddingVertical;
  final String text;
  final bool limitOneLine;
  final TextButtonType type;
  final Alignment aligment;
  final Icon? icon;
  final bool centerInRow;

  TextButtonProps(
      {this.paddingHorizontal = 0,
      this.paddingVertical = 0,
      this.limitOneLine = false,
      this.icon,
      required this.text,
      required this.type,
      this.aligment = Alignment.center,
      this.centerInRow = false});

  factory TextButtonProps.fromMap(Map<String, dynamic> json) => TextButtonProps(
      paddingHorizontal: json["padding"] ?? AppTheme.sizePadding,
      text: json["text"] ?? '',
      type: json["type"] ?? TextButtonType);
}
