
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class AppTheme {
  static const Color primaryColor = Colors.black;
  static const Color underlineButtonText = Color(0xFF272937);
  static const Color lightColor = Color(0xFF78909c);
  static const Color grayDarkColor = Color(0xFF272937);
  static const Color borderColor = Color.fromARGB(255, 207, 207, 207);
  static const Color secondaryColor = Colors.white;
  static const Color tertaryColor = Color.fromARGB(13, 39, 41, 41);
  static const Color statusColorError = Color(0xFFFFEBEE);
  static const Color backgroundLightColor = Color.fromARGB(255, 242, 247, 253);
  static const Color backgroundSuccess = Color(0xFF0075FF);
  static const Color backgroundSuccessGreen = Color(0xFFE0EEF0);
  static const Color borderSuccess = Color(0xFFF0FAFF);
  static const Color statusColorNormal = Color(0xFFCFF1F9);
  static const Color statusColorPending = Color(0xFFFFEFD0);
  static const Color statusColorSuccess = Color(0xFFCFF9D8);
  static const Color highColor = Color(0xFF00E6F5);
  static const Color darkColor = Color(0x59272937);
  static const Color navColor = Colors.white; //Color(0xFFE1EDF4);
  static const Color headerNavigation = Color(0xFFE0F3FF);
  static const Color textButtonColor = Color.fromARGB(35, 39, 41, 55);
  static const Color orderOutstandingColor = Color(0xFFFFDCA7);
  static const Color orderDefaulteColor = Color(0xFFFE9797);
  static const Color orderLateColor = Color(0xFFFE9797);
  static const Color orderInProgress = Color(0xFFFFDCA7);
  static const Color orderPendingColor = Color(0xFF7A7B86);
  static const Color orderPaidColor = Color(0xFF9AF4B9);
  static const Color orderAdvertisementPendingPayColor = Color(0xFFF6F6F7);
  static const Color orderAdvertisementBorderPendingPayColor =
      Color(0xFFBABFC3);
  static const Color orderAdvertisementSameDayColor = Color(0xFFFFF5EA);
  static const Color orderAdvertisementBorderSameDayColor = Color(0xFFE1B878);
  static const Color orderAdvertisementLateOrDefaultedColor = Color(0xFFFFF4F4);
  static const Color orderAdvertisementeLateOrDefaultedBorderColor =
      Color(0xFFE0B3B2);
  static const Color geolocationEmptyCardBackground = Color(0xFFF0FAFF);
  static const Color exploreHeader = Color.fromARGB(10, 25, 145, 255);
  static const Color orderAdvertisementPaymentError = Color(0xFFD72C0D);
  static const Color disable = Color(0x2729370D);
  static const Color bulletDisable = Colors.black54;

  // Referrals
  static const Color pointsWinner = Color(0xFF5FC7A4);
  static const Color pointsInProcess = Color(0xff6080E9);
  static const Color pointsDenied = Color(0xFFF44336);

  // Size fonts
  static const double sizeDisplayFont = 56.0;
  static const double sizeHeadFont = 30.0;
  static const double sizeHeadMediumFont = 24.0;
  static const double sizeMainTitleFont = 18.0;
  static const double sizeButtonTitleFont = 13.0;
  static const double sizeTextSmallFont = 12.0;
  static const double sizeTextFont = 16.0;
  static const double sizeTextMediumFont = 16.0;
  static const double sizeTextLargeFont = 20.0;
  static const double sizeSmallFont = 14.0;
  static const double sizeSmallXFont = 13.0;
  static const double sizeMicroFont = 10.0;
  static const double sizePadding = 16.0;
  static const double smallIconSize = 12.0;
  static const double smallLabel = 10.0;

  // New demiension styles
  static const double size8 = 8;
  static const double size18 = 18;
  static const double size14 = 14;
  static const double size10 = 10;
  static const double size12 = 12;
  static const double size20 = 20;
  static const double size24 = 24;
  static const double size16 = 16;
  static const double size32 = 32;

  // common images
  static const String whatsappIcon = "assets/images/common_use/whatsapp.png";

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    dividerColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), elevation: 0)),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppTheme.highColor,
      headerForegroundColor: AppTheme.primaryColor,
      headerHeadlineStyle: TextStyle(
        color: TextType.headMedium.color,
        fontSize: TextType.headMedium.size,
        fontWeight: TextType.headMedium.fontWeight,
        fontFamily: TextType.headMedium.fontFamily,
      ),
      dayStyle: TextStyle(
        color: TextType.text.color,
        fontSize: TextType.text.size,
        fontWeight: TextType.text.fontWeight,
        fontFamily: TextType.text.fontFamily,
      ),
      dayOverlayColor:
          MaterialStateProperty.resolveWith((states) => AppTheme.highColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      yearStyle: TextStyle(
        color: TextType.text.color,
        fontSize: TextType.text.size,
        fontWeight: TextType.text.fontWeight,
        fontFamily: TextType.text.fontFamily,
      ),
      yearOverlayColor:
          MaterialStateProperty.resolveWith((states) => AppTheme.primaryColor),
      weekdayStyle: TextStyle(
        color: TextType.text.color,
        fontSize: TextType.text.size,
        fontWeight: TextType.text.fontWeight,
        fontFamily: TextType.text.fontFamily,
      ),
      surfaceTintColor: AppTheme.highColor,
    ),
  );
}
