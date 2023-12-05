import 'package:flutter/material.dart';

import '../buttons/aplazo_button.dart';
import '../texts/aplazo_text.dart';

class AplazoAlert extends StatelessWidget {
  const AplazoAlert({Key? key, required this.alert, this.forceAlign = false})
      : super(key: key);
  final AlertProps alert;
  final bool forceAlign;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: alert.customMargin ?? EdgeInsets.all(alert.padding),
      color: alert.type.backgroundColor.withAlpha(26),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: alert.type.borderColor, //<-- SEE HERE
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [alert.type.icon],
        ),
        title: Visibility(
          visible: alert.title.isNotEmpty,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AplazoText(
                  textProps: TextProps(
                      multiAligment: TextAlign.left,
                      paddingVertical: forceAlign ? 0 : 4,
                      aligment: Alignment.centerLeft,
                      text: alert.title,
                      type: TextType.headSection)),
            ],
          ),
        ),
        minLeadingWidth: 0,
        minVerticalPadding: forceAlign ? 16 : 8,
        subtitle: forceAlign
            ? null
            : Column(
                children: [
                  Visibility(
                    visible: alert.bodyText.isNotEmpty,
                    child: AplazoText(
                        textProps: TextProps(
                            multiAligment: TextAlign.left,
                            paddingHorizontal: 0,
                            paddingVertical: 0,
                            aligment: Alignment.centerLeft,
                            text: alert.bodyText,
                            type: TextType.text)),
                  ),
                  Visibility(
                      visible: alert.button != null,
                      child: Row(
                        children: [
                          AplazoButton(
                            buttonProps: ButtonProps(
                              verticalPadding: 8,
                              horizontalPadding: 0,
                              buttonType: ButtonType.primary,
                              text: alert.button?.title ?? '',
                            ),
                            onPressed: () {
                              alert.button?.onPress() ?? () {};
                            },
                          ),
                          const Spacer()
                        ],
                      ))
                ],
              ),
      ),
    );
  }
}

enum AlertType {
  normal(
      icon: ImageIcon(
        AssetImage('assets/images/alerts/alert_information.png'),
        color: Color(0xff5C5F62),
      ),
      backgroundColor: Color(0xffBABFC3),
      borderColor: Color(0xff5C5F62)),
  success(
      icon: ImageIcon(AssetImage('assets/images/alerts/alert_information.png')),
      backgroundColor: Color(0xffF1F8F5),
      borderColor: Color(0xff007F5F)),
  warning(
      icon: ImageIcon(AssetImage('assets/images/alerts/alert_information.png'),
          color: Color(0xffD6a75e)),
      backgroundColor: Color(0xffFFF5EA),
      borderColor: Color(0xffD6a75e)),
  info(
      icon: ImageIcon(AssetImage('assets/images/alerts/alert_information.png'),
          color: Color(0xFF0075FF)),
      backgroundColor: Color(0xff98C6CD),
      borderColor: Color(0xff0075FF)),
  critical(
      icon: ImageIcon(AssetImage('assets/images/alerts/alert_critical.png'),
          color: Color(0xFFD72C0D)),
      backgroundColor: Color(0xffE0B3B2),
      borderColor: Color(0xffE0B3B2));

  const AlertType(
      {required this.icon,
      required this.backgroundColor,
      required this.borderColor});
  final ImageIcon icon;
  final Color borderColor;
  final Color backgroundColor;
}

class AlertProps {
  final String title;
  final double padding;
  final EdgeInsets? customMargin;
  String bodyText;
  final AlertType type;
  final ButtonAlertProps? button;
  AlertProps(
      {this.button,
      this.padding = 16,
      this.title = '',
      this.customMargin,
      required this.bodyText,
      required this.type});
}

class ButtonAlertProps {
  final String title;
  final Function onPress;
  const ButtonAlertProps({required this.title, required this.onPress});
}
