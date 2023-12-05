import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoLoader extends StatefulWidget {
  const AplazoLoader({Key? key}) : super(key: key);
  //bool isLoading;
  @override
  State<AplazoLoader> createState() => _AplazoLoaderState();
}

class _AplazoLoaderState extends State<AplazoLoader>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.animateTo(1.0);
    //controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          color: AppTheme.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.sizePadding),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/gifs/loader.gif",
                height: 150.0,
                width: 300.0,
              ),

              /*LinearProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              )*/
            ]),
          ),
        ),
      ),
    );
  }
}
