import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoNavbar extends StatelessWidget implements PreferredSizeWidget {
  const AplazoNavbar(
      {Key? key,
      required this.navbarProps,
      this.backFuction})
      : super(key: key);
  final NavbarProps navbarProps;
  final Function? backFuction;
  @override
  Widget build(BuildContext context) {

    final double widthSize =
        (navbarProps.iconButton ?? []).isEmpty ? 50.0 : 0.0;
    final int numButtons = navbarProps.iconButton?.length ?? 0;
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          height: 1.0,
          color: AppTheme.highColor,
        ),
      ),
      backgroundColor: AppTheme.navColor,
      leading: navbarProps.leading ??
          Visibility(
            visible: navbarProps.isBackEnable,
            child: IconButton(
              icon: const Icon(Icons.navigate_before,
                  color: AppTheme.primaryColor),
              onPressed: () {
                if (backFuction != null) {
                  backFuction!();
                }
                context.hideKeyboard();
                Navigator.of(context).pop();
              },
            ),
          ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: AplazoText(
                  textProps: TextProps(
                      text: navbarProps.title,
                      type: TextType.lightTitle,
                      aligment: numButtons > 2
                          ? Alignment.centerLeft
                          : Alignment.center,
                      limitOneLine: true,
                      multiAligment: TextAlign.center))),
          SizedBox(width: widthSize)
        ],
      ),
      actions: navbarProps.iconButton,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class NavbarProps {
  final String title;
  final bool isBackEnable;
  final List<Widget>? iconButton;
  final Widget? leading;

  NavbarProps(
      {required this.title,
      this.iconButton,
      this.isBackEnable = true,
      this.leading});
}
