import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AplazoLoaderView extends StatelessWidget {
  const AplazoLoaderView({super.key});

  static const loaderAplazo = 'assets/lotties/cat_aplazo.json';

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: LottieBuilder.asset(
        loaderAplazo,
        width: 106,
        height: 106,
      ),
    ));
  }
}
