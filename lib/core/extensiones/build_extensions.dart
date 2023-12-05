import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

extension Navigation on BuildContext {
  void back() {
    Navigator.of(this).pop();
  }

  void navigateToReplacement(String route) {
    Navigator.pushReplacementNamed(this, route);
  }

  String createUUID() {
    const uuidObj = Uuid();
    return uuidObj.v4();
  }

  void materialPush({required Widget screen, Object? arguments}) {
    Navigator.push(
        this,
        MaterialPageRoute(
            builder: (context) => screen,
            settings: RouteSettings(
                name: screen.runtimeType.toString(), arguments: arguments)));
  }

  void materialPushReplacement({required Widget screen, Object? arguments}) {
    Navigator.pushReplacement(
        this,
        MaterialPageRoute(
            builder: (context) => screen,
            settings: RouteSettings(
                name: screen.runtimeType.toString(), arguments: arguments)));
  }

  void materialPushAndRemoveUntil(
      {required Widget screen, Object? arguments, bool rootNavigator = false}) {
    Navigator.of(this, rootNavigator: rootNavigator).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => screen,
            settings: RouteSettings(name: screen.runtimeType.toString())),
        ModalRoute.withName(screen.runtimeType.toString()));
  }

  Future<T> materialPushWithReturn<T>(
      {required Widget screen, Object? arguments}) async {
    return await Navigator.push(
        this,
        MaterialPageRoute(
            builder: (context) => screen,
            settings: RouteSettings(name: screen.runtimeType.toString())));
  }

  String getLoanId(String urlLoanId) {
    final loanArray = urlLoanId.split("main/");
    return loanArray.last;
  }

  String checkPlatformError() {
    if (Platform.isAndroid) {
      return "APPAND";
    } else if (Platform.isIOS) {
      return "APPIOS";
    } else {
      return "NOTIMPL";
    }
  }

  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

extension SafeA on BuildContext {
  double getMediaQuerySize() {
    double platformSize = Platform.isAndroid ? 200 : 100;
    return MediaQuery.of(this).size.height - platformSize;
  }
}

extension Launch on BuildContext {
  Future<void> launchInBrowser(String url) async {
    final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
    if (await launcher.canLaunch(url)) {
      await launcher.launch(
        url,
        useSafariVC: false,
        useWebView: false,
        enableJavaScript: false,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
