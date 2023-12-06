import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/login/presentation/logins_screen.dart';
import 'package:flutter_posui_pocket/ui/components/loaders/aplazo_loader_view.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  static const idScreen = 'splash_screen';
  static const headerAplazo = 'assets/images/aplazo_header.svg';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    moveTo(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          SvgPicture.asset(headerAplazo),
          const SizedBox(
            height: 150,
          ),
          AplazoText(
              textProps: TextProps(
                  type: TextType.headlineSize16Weight700,
                  text: 'Bienvenido a POSUI\nPocket')),
          const AplazoLoaderView()
        ],
      )),
    );
  }

  moveTo(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      context.materialPushAndRemoveUntil(screen: const LoginScreen());
    });
  }
}
