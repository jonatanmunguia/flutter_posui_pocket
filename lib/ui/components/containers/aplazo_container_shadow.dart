import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoContainerShadow extends StatelessWidget {
  const AplazoContainerShadow({super.key, required this.columnList});
  final List<Widget> columnList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(28.5)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.borderColor.withAlpha(150),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: columnList),
    );
  }
}
