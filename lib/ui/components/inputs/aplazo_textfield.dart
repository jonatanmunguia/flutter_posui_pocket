import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';
import 'package:masked_text/masked_text.dart';

class AplazoTextField extends StatefulWidget {
  const AplazoTextField(
      {Key? key,
      required this.textFieldProps,
      required this.onChanged,
      required this.controller,
      this.onFocus,
      this.onFieldSubmitted})
      : super(key: key);
  final TextFieldProps textFieldProps;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function? onFocus;
  final Function(String)? onFieldSubmitted;

  @override
  State<AplazoTextField> createState() => _AplazoTextFieldState();
}

class _AplazoTextFieldState extends State<AplazoTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              widget.textFieldProps.isPadding ? AppTheme.sizePadding : 0,
          vertical: widget.textFieldProps.isPadding
              ? widget.textFieldProps.verticalPadding
              : 0),
      child: Column(
        children: [
          Visibility(
            visible: widget.textFieldProps.label?.isNotEmpty ?? false,
            child: AplazoText(
                textProps: TextProps(
                    aligment: Alignment.centerLeft,
                    text: widget.textFieldProps.label ?? '',
                    paddingHorizontal: 4,
                    paddingVertical: widget.textFieldProps.verticalPadding,
                    type: widget.textFieldProps.newStyle
                        ? TextType.textSectionSmallFontSmall
                        : TextType.smallText)),
          ),
          Visibility(
              visible: widget.textFieldProps.newStyle ||
                  widget.textFieldProps.verticalPadding == 0,
              child: const SizedBox(
                height: 8.0,
              )),
          MaskedTextField(
            enabled: widget.textFieldProps.isEnable,
            validator: (value) {
              return 'Invalid';
            },
            textCapitalization: widget.textFieldProps.capitalization
                ? TextCapitalization.characters
                : TextCapitalization.none,
            inputFormatters:
                widget.textFieldProps.textFieldType.regex.isNotEmpty
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp(widget.textFieldProps.textFieldType.regex))
                      ]
                    : widget.textFieldProps.customFormatter ?? [],
            controller: widget.controller,
            style: TextStyle(
                color: widget.textFieldProps.isEnable
                    ? AppTheme.primaryColor
                    : AppTheme.borderColor,
                fontSize: AppTheme.sizeTextFont,
                fontWeight: FontWeight.w300,
                fontFamily: 'Manrope'),
            mask: widget.textFieldProps.textFieldType.mask ??
                widget.textFieldProps.mask,
            maxLength: widget.textFieldProps.textFieldType.maxLength ??
                widget.textFieldProps.maxLenght,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.textFieldProps.textFieldType.isCvv ||
                widget.textFieldProps.isPassword &&
                    widget.textFieldProps.showPassword,
            maxLines: widget.textFieldProps.textFieldType.isCvv ||
                    widget.textFieldProps.isPassword
                ? 1
                : null,
            keyboardType: widget.textFieldProps.textFieldType.textInputType,
            autofocus: widget.textFieldProps.autofocus,
            autocorrect: widget.textFieldProps.autocorrect,
            textInputAction: widget.textFieldProps.textInputAction,
            onTap: () {
              if (widget.onFocus != null) {
                widget.onFocus!();
              }
            },
            onChanged: (value) {
              widget.textFieldProps.showError = validateInput(value);
              widget.onChanged(value);
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              counter: const Offstage(),
              hintText: widget.textFieldProps.hintText,
              errorText: widget.textFieldProps.showError
                  ? widget.textFieldProps.errorText
                  : null,
              hintStyle: TextStyle(
                  fontSize: TextType.smallText.size,
                  color: TextType.smallText.color,
                  fontWeight: TextType.smallText.fontWeight),
              helperText: widget.textFieldProps.helperText,
              prefixIcon: widget.textFieldProps.textFieldType.customWidget,
              suffixIcon: widget.textFieldProps.suffixCustomWidget ?? widget.textFieldProps.textFieldType.suffix,
              disabledBorder:
                  _getOutlineInputBorder(AppTheme.borderColor.withAlpha(150)),
              border: _getOutlineInputBorder(AppTheme.borderColor),
              enabledBorder: _getOutlineInputBorder(AppTheme.borderColor),
              focusedBorder: _getOutlineInputBorder(AppTheme.primaryColor),
              filled: widget.textFieldProps.backgroundColor != null,
              counterText: widget.textFieldProps.withCounter ? null : "",
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              errorStyle: const TextStyle(fontSize: 10),
              fillColor: widget.textFieldProps.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  bool validateInput(String value) {
    if (value.isEmpty) {
      return false;
    }
    return value[value.length - 1] == ' ';
  }
}

OutlineInputBorder _getOutlineInputBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: color));
}

enum TextFieldType {
  normal(textInputType: TextInputType.text),
  search(
      textInputType: TextInputType.text,
      suffixIcon: Icons.search,
      autofocus: false),
  number(textInputType: TextInputType.number),
  name(textInputType: TextInputType.name, regex: '[A-Za-z À-ú]+'),
  promoCode(textInputType: TextInputType.name, regex: '[A-Za-z0-9]+'),
  referralCode(textInputType: TextInputType.text, regex: '[A-Za-z0-9-]+'),
  phone(
      textInputType: TextInputType.number,
      prefixType: PrefixType.text,
      regex: '[0-9]'),
  cvv(textInputType: TextInputType.number, isCvv: true, maxLength: 4),
  code(textInputType: TextInputType.number, regex: '[0-9]'),
  email(textInputType: TextInputType.emailAddress, regex: "[a-zA-Z0-9@_.]");

  const TextFieldType(
      {required this.textInputType,
      this.prefixType = PrefixType.icon,
      this.regex = '',
      this.autofocus = false,
      this.isCvv = false,
      this.maxLength,
      this.suffixIcon,
      this.mask});

  final TextInputType textInputType;
  final String regex;
  final PrefixType prefixType;
  final bool isCvv;
  final bool autofocus;
  final int? maxLength;
  final String? mask;
  final IconData? suffixIcon;

  Widget? get customWidget {
    if (prefixType == PrefixType.icon) {
      return null;
    }
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8.0, bottom: 4),
              child: AplazoText(
                  textProps: TextProps(
                text: '🇲🇽 +52',
                type: TextType.text,
              )),
            ),
          ),
        ]);
  }

  IconButton? get suffix {
    if (suffixIcon != null) {
      return IconButton(
        onPressed: null,
        icon: Icon(suffixIcon),
      );
    }
    return null;
  }
}

enum PrefixType { icon, text }

class TextFieldProps {
  final TextFieldType textFieldType;
  final bool isEnable;
  final bool isPadding;
  final bool autofocus;
  final bool autocorrect;
  final bool capitalization;
  String? label;
  String? hintText;
  String? helperText;
  String errorText;
  bool showError;
  final int maxLenght;
  final String mask;
  final bool withCounter;
  final bool newStyle;
  final Color? backgroundColor;
  final List<TextInputFormatter>? customFormatter;
  final double verticalPadding;
  final TextInputAction? textInputAction;

  final Widget? suffixCustomWidget;

  final bool isPassword;

  final bool showPassword;

  TextFieldProps(
      {this.hintText,
      required this.textFieldType,
      this.helperText,
      this.label,
      this.isPadding = true,
      this.autofocus = false,
      this.autocorrect = true,
      this.isEnable = true,
      this.withCounter = true,
      this.newStyle = false,
      this.isPassword = false,
      this.suffixCustomWidget,
      this.showPassword = false,
      this.errorText = 'Campo inválido',
      this.maxLenght = 20,
      this.showError = false,
      this.capitalization = false,
      this.customFormatter,
      this.backgroundColor,
      this.mask = '',
      this.verticalPadding = 4,
      this.textInputAction});
}
