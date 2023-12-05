import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoButton extends StatelessWidget {
  const AplazoButton(
      {Key? key,
      required this.buttonProps,
      required this.onPressed,
      this.isEnable = true})
      : super(key: key);
  final ButtonProps buttonProps;
  final VoidCallback onPressed;
  final bool isEnable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: buttonProps.horizontalPadding,
          vertical: buttonProps.verticalPadding),
      child: ElevatedButton(
          onPressed: isEnable
              ? () {
                  onPressed();
                }
              : null,
          style: _getButtonStyle(buttonProps.buttonType, isEnable),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: buttonProps.buttonType == ButtonType.link
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: buttonProps.buttonType == ButtonType.link
                        ? 0
                        : buttonProps.slim
                            ? 10
                            : 14),
                child: Row(
                  children: [
                    Visibility(
                        visible: buttonProps.iconData != null
                            ? true
                            : buttonProps.icon.isNotEmpty,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: buttonProps.iconData != null
                                ? Icon(
                                    buttonProps.iconData,
                                    size: buttonProps.iconSize,
                                    color: isEnable
                                        ? buttonProps.buttonType.textColor
                                        : AppTheme.disable,
                                  )
                                : Image.asset(
                                    buttonProps.icon,
                                    width: buttonProps.iconSize,
                                    height: buttonProps.iconSize,
                                    color: isEnable
                                        ? buttonProps.buttonType.textColor
                                        : AppTheme.disable,
                                  ))),
                    Text(
                        buttonProps.buttonType == ButtonType.link
                            ? buttonProps.text
                            : buttonProps.text.toUpperCase(),
                        style: _getStyle(
                            isEnable
                                ? buttonProps.buttonType.textColor
                                : AppTheme.primaryColor.withAlpha(75),
                            buttonProps.buttonType.textDecoration,
                            buttonProps.buttonType.fontSize,
                            buttonProps.buttonType.fontWeight)),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

TextStyle _getStyle(Color color, TextDecoration textDecoration, double fontSize,
    FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'Manrope',
      decoration: textDecoration);
}

ButtonStyle _getButtonStyle(ButtonType button, bool isEnable) {
  if (button == ButtonType.link) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      alignment: Alignment.centerLeft,
      minimumSize: MaterialStateProperty.all<Size>(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  return ButtonStyle(
    foregroundColor: button.materialTextColor,
    backgroundColor: isEnable
        ? button.materialBackgroundColor
        : MaterialStateProperty.all<Color>(AppTheme.primaryColor.withAlpha(15)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(
                color: isEnable
                    ? button.borderColor
                    : button.borderColor.withAlpha(52)))),
    elevation: MaterialStateProperty.all(0),
  );
}

enum ButtonType {
  primary(
      AppTheme.primaryColor, AppTheme.secondaryColor, AppTheme.primaryColor),
  secondary(
      AppTheme.secondaryColor, AppTheme.primaryColor, AppTheme.primaryColor),
  xsSecondary(
      AppTheme.secondaryColor, AppTheme.primaryColor, AppTheme.primaryColor,
      fontSize: 10),
  tertary(AppTheme.tertaryColor, AppTheme.primaryColor, AppTheme.tertaryColor),
  link(AppTheme.secondaryColor, AppTheme.primaryColor, AppTheme.primaryColor,
      textDecoration: TextDecoration.underline,
      fontSize: 14,
      fontWeight: FontWeight.w600);

  const ButtonType(this.backgroundColor, this.textColor, this.borderColor,
      {this.textDecoration = TextDecoration.none,
      this.fontSize = 13,
      this.fontWeight = FontWeight.w700});

  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;

  MaterialStateProperty<Color> get materialBackgroundColor {
    return MaterialStateProperty.all<Color>(backgroundColor);
  }

  MaterialStateProperty<Color> get materialTextColor {
    return MaterialStateProperty.all<Color>(textColor);
  }
}

class ButtonProps {
  final ButtonType buttonType;
  final String text;
  final String icon;
  final IconData? iconData;
  final double horizontalPadding;
  final double verticalPadding;
  final bool slim;
  final double iconSize;
  String? tag;

  ButtonProps(
      {required this.buttonType,
      required this.text,
      this.icon = '',
      this.iconData,
      this.tag,
      this.iconSize = 24,
      this.slim = false,
      this.horizontalPadding = AppTheme.sizePadding,
      this.verticalPadding = 0});
}
