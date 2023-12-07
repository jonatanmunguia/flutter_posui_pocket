import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoText extends StatelessWidget {
  const AplazoText({Key? key, required this.textProps}) : super(key: key);
  final TextProps textProps;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: textProps.aligment,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: textProps.paddingHorizontal,
              vertical: textProps.paddingVertical),
          child: Text(textProps.text,
              style: _getStyle(textProps.type),
              textAlign: textProps.multiAligment,
              maxLines: textProps.maxLines,
              overflow: textProps.limitOneLine
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible)),
    );
  }
}

TextStyle _getStyle(TextType text) {
  return TextStyle(
      color: text.color,
      fontSize: text.size,
      fontWeight: text.fontWeight,
      fontFamily: text.fontFamily,
      decoration: text.decoration);
}

enum TextType {
  display(AppTheme.sizeDisplayFont, AppTheme.primaryColor, FontWeight.w700),
  mainTitle(AppTheme.sizeMainTitleFont, AppTheme.primaryColor, FontWeight.bold,
      fontFamily: 'NewSpirit'),
  headMedium(
      AppTheme.sizeHeadMediumFont, AppTheme.primaryColor, FontWeight.bold),
  homeName(AppTheme.sizeHeadMediumFont, AppTheme.primaryColor, FontWeight.bold,
      fontFamily: 'NewSpirit'),
  homeSmall(AppTheme.sizeSmallXFont, AppTheme.primaryColor, FontWeight.w300,
      fontFamily: 'NewSpirit'),
  homeCredit(AppTheme.sizeTextFont, AppTheme.primaryColor, FontWeight.w400),
  headMediumSize16(
      AppTheme.sizeTextMediumFont, AppTheme.primaryColor, FontWeight.bold),
  headMediumSize20(
      AppTheme.sizeTextLargeFont, AppTheme.primaryColor, FontWeight.bold),
  headSmall(AppTheme.sizeTextSmallFont, AppTheme.primaryColor, FontWeight.bold),
  headSmallGray(AppTheme.size12, AppTheme.grayDarkColor, FontWeight.bold),
  head(AppTheme.sizeHeadFont, AppTheme.primaryColor, FontWeight.bold),
  head24(AppTheme.size24, AppTheme.primaryColor, FontWeight.bold),
  head20(AppTheme.size20, AppTheme.primaryColor, FontWeight.bold),
  smallBlue(AppTheme.size12, AppTheme.backgroundSuccess, FontWeight.w300),
  homehead(AppTheme.size32, AppTheme.primaryColor, FontWeight.bold),
  lightTitle(
      AppTheme.sizeMainTitleFont, AppTheme.primaryColor, FontWeight.w700),
  lightTitle24(AppTheme.size24, AppTheme.primaryColor, FontWeight.w700),
  lightTitleWhite(
      AppTheme.sizeMainTitleFont, AppTheme.secondaryColor, FontWeight.w700),
  lightTitle16(AppTheme.size16, AppTheme.primaryColor, FontWeight.w700),
  text(AppTheme.sizeTextFont, AppTheme.primaryColor, FontWeight.w300),
  graytext(
      AppTheme.sizeTextFont, AppTheme.underlineButtonText, FontWeight.w300),
  secondaryText(AppTheme.sizeTextFont, Color(0xBF272937), FontWeight.w400),
  cardText(AppTheme.sizeTextSmallFont, AppTheme.primaryColor, FontWeight.w600),
  textSize16W400(
      AppTheme.sizeTextMediumFont, AppTheme.primaryColor, FontWeight.w400),
  textGreen(
      AppTheme.sizeTextFont, Color.fromARGB(255, 0, 166, 64), FontWeight.w300),
  textBlue(AppTheme.sizeTextFont, Colors.blue, FontWeight.w300),
  underlineText(AppTheme.sizeTextFont, AppTheme.primaryColor, FontWeight.w300,
      decoration: TextDecoration.underline),
  underlineTextButton(
      AppTheme.sizeSmallFont, AppTheme.underlineButtonText, FontWeight.w700,
      decoration: TextDecoration.underline),
  lightText(AppTheme.sizeTextFont, AppTheme.lightColor, FontWeight.w300),
  lightTextManrope(
      AppTheme.sizeTextMediumFont, AppTheme.lightColor, FontWeight.w300),
  lightTextBig(
      AppTheme.sizeMainTitleFont, AppTheme.lightColor, FontWeight.w300),
  headLightText(
      AppTheme.sizeTextSmallFont, AppTheme.lightColor, FontWeight.bold),
  smallText(AppTheme.sizeSmallFont, AppTheme.lightColor, FontWeight.w300),
  smallPrimaryText(
      AppTheme.sizeSmallFont, AppTheme.primaryColor, FontWeight.w600),
  microText(AppTheme.sizeMicroFont, AppTheme.lightColor, FontWeight.w300,
      fontFamily: 'Manrope'),
  microTextBlack(AppTheme.size12, AppTheme.primaryColor, FontWeight.w300,
      fontFamily: 'Manrope'),
  smallCircleText(
      AppTheme.sizeSmallFont, AppTheme.secondaryColor, FontWeight.w700),
  smallHighText(AppTheme.sizeSmallFont, AppTheme.highColor, FontWeight.w700),
  smallDarkText(AppTheme.sizeSmallFont, AppTheme.darkColor, FontWeight.w700),
  headSection(AppTheme.sizeTextFont, AppTheme.primaryColor, FontWeight.w700),
  headSection18(AppTheme.size18, AppTheme.primaryColor, FontWeight.w700),
  headSection14(AppTheme.size14, AppTheme.primaryColor, FontWeight.w700),
  text14(AppTheme.size14, AppTheme.primaryColor, FontWeight.w300),
  headSectionSmall(
      AppTheme.sizeTextSmallFont, AppTheme.primaryColor, FontWeight.w700),
  headSectionSmallSecondaryColor(
      AppTheme.sizeTextSmallFont, AppTheme.secondaryColor, FontWeight.w700),
  textSectionSmall(
      AppTheme.sizeMainTitleFont, AppTheme.primaryColor, FontWeight.w300),
  textSectionSmallFontSmall(
      AppTheme.sizeTextSmallFont, AppTheme.primaryColor, FontWeight.w300),
  listItemTitle(AppTheme.sizeTextFont, AppTheme.primaryColor, FontWeight.w600),
  listItemTitleRed(
      AppTheme.sizeTextFont, AppTheme.orderDefaulteColor, FontWeight.w600),
  listItemSubtitle(
      AppTheme.sizeTextSmallFont, AppTheme.lightColor, FontWeight.normal),
  lightSectionSmall(
      AppTheme.sizeTextSmallFont, AppTheme.primaryColor, FontWeight.normal),
  // New Styles
  headlineSize24Weight700(
      AppTheme.size24, AppTheme.primaryColor, FontWeight.bold),
  headlineSize20Weight700(
      AppTheme.size20, AppTheme.primaryColor, FontWeight.bold),
  headlineSize16Weight700(
      AppTheme.size16, AppTheme.primaryColor, FontWeight.bold),
  headlineSize12Weight400GreyDarkColor(
      AppTheme.size12, AppTheme.grayDarkColor, FontWeight.w400),
  headlineSize12Weight400Disable(
      AppTheme.size12, AppTheme.bulletDisable, FontWeight.w400),
  headlineSize16Weight400(
      AppTheme.size16, AppTheme.primaryColor, FontWeight.w400),
  headlineSize14Weight400(
      AppTheme.size14, AppTheme.primaryColor, FontWeight.w400),
  headlineSize12Weight400(
      AppTheme.size12, AppTheme.primaryColor, FontWeight.w400),
  headlineSize12Weight500(
      AppTheme.size12, AppTheme.primaryColor, FontWeight.w500),
  headlineSize14Weight700GrayDarkColor(
      AppTheme.size14, AppTheme.grayDarkColor, FontWeight.w700),
  headlineSize12Weight500DisableColor(
      AppTheme.size12, AppTheme.bulletDisable, FontWeight.w500),
  headlineSize12Weight400Red(AppTheme.size12,
      AppTheme.orderAdvertisementPaymentError, FontWeight.w400),
  headlineSize18Weight600White(
      AppTheme.size18, AppTheme.secondaryColor, FontWeight.w600),
  headlineSize16Weight400White(
      AppTheme.size16, AppTheme.secondaryColor, FontWeight.w400),
  headlineSize16Weight400DarkSecondary(
      AppTheme.size16, AppTheme.grayDarkColor, FontWeight.w400),
  headlineSize8Weight400DarkSecondary(
      AppTheme.size8, AppTheme.grayDarkColor, FontWeight.w400),
  headlineSize32Weight700(
      AppTheme.size32, AppTheme.primaryColor, FontWeight.bold),
  headlineSize14Weight700(
      AppTheme.size14, AppTheme.textButtonColor, FontWeight.bold),
  headlineSize14Weight700Primary(
      AppTheme.size14, AppTheme.primaryColor, FontWeight.bold),
  headlineSize14Weight600(
      AppTheme.size14, AppTheme.textButtonColor, FontWeight.w600),
  headlineSize14Weight400PrimaryColor(
      AppTheme.size14, AppTheme.primaryColor, FontWeight.w400),
  headlineSize14Weight600Primary(
      AppTheme.size14, AppTheme.primaryColor, FontWeight.w600),
  headlineSize12Weight700Disable(
      AppTheme.size12, AppTheme.disable, FontWeight.bold),
  headlineSize14Weight700PrimaryColor(
      AppTheme.size14, AppTheme.primaryColor, FontWeight.bold),
  headlineSize12Weight600Semibold(
      AppTheme.size12, AppTheme.primaryColor, FontWeight.w600),
  headSectionDisable(AppTheme.sizeTextFont, AppTheme.disable, FontWeight.w700),

  // Points
  pointsLegend(AppTheme.smallLabel, Color(0xBF272937), FontWeight.w400),
  pointsDescriptionLabel(
      AppTheme.sizeSmallFont, AppTheme.primaryColor, FontWeight.w600),
  pointsAmountLabel(
      AppTheme.sizeSmallFont, AppTheme.primaryColor, FontWeight.w500),
  pointsExpiryLabel(AppTheme.smallLabel, Color(0xBF272937), FontWeight.w600),
  pointsActiveLabel(AppTheme.smallLabel, Color(0xFF5FC7A4), FontWeight.w600),
  pointsExpiredLabel(AppTheme.smallLabel, Color(0xFFD5A75E), FontWeight.w600),
  pointsSpentLabel(AppTheme.smallLabel, Color(0xFFF44336), FontWeight.w600),
  pointsCancelledLabel(AppTheme.smallLabel, Color(0xBF272937), FontWeight.w600),
  headlineSize12Weight500DarkGray(
      AppTheme.size12, AppTheme.grayDarkColor, FontWeight.w500),
  headlineSize12Weight400PointsWinner(
      AppTheme.size12, AppTheme.pointsWinner, FontWeight.w400),
  headlineSize12Weight400PointsInProcess(
      AppTheme.size12, AppTheme.pointsInProcess, FontWeight.w400),
  headlineSize12Weight400PointsDenied(
      AppTheme.size12, AppTheme.pointsDenied, FontWeight.w400);

  const TextType(this.size, this.color, this.fontWeight,
      {this.fontFamily = 'Manrope', this.decoration = TextDecoration.none});

  final double size;
  final Color color;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextDecoration decoration;
}

class TextProps {
  final double paddingHorizontal;
  final double paddingVertical;
  final String text;
  final bool limitOneLine;
  final TextType type;
  final Alignment aligment;
  final TextAlign multiAligment;
  final int? maxLines;

  TextProps(
      {this.paddingHorizontal = 0,
      this.paddingVertical = 0,
      this.limitOneLine = false,
      this.maxLines,
      required this.text,
      this.type = TextType.text,
      this.multiAligment = TextAlign.center,
      this.aligment = Alignment.center});

  factory TextProps.fromMap(Map<String, dynamic> json) => TextProps(
      paddingHorizontal: json["padding"] ?? AppTheme.sizePadding,
      text: json["text"] ?? '',
      type: json["type"] ?? TextType.text);
}
