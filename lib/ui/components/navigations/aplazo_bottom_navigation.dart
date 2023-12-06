import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoBottomNavigation extends StatelessWidget {
  final BottomNavigationProps bottomNavigationProps;
  final ValueChanged<int> onTap;

  const AplazoBottomNavigation(
      {Key? key, required this.bottomNavigationProps, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavigationProps.options,
      currentIndex: bottomNavigationProps.selectedIndex,
      selectedLabelStyle: _getStyle(AppTheme.primaryColor),
      unselectedLabelStyle: _getStyle(AppTheme.lightColor),
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.lightColor,
      onTap: onTap,
    );
  }

  TextStyle _getStyle(Color color) {
    return TextStyle(
        color: color,
        fontSize: AppTheme.size12,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope',
        decoration: TextDecoration.none);
  }
}

class BottomNavigationProps {
  int selectedIndex;
  final List<BottomNavigationBarItem> options;

  BottomNavigationProps({required this.selectedIndex, required this.options});
}
