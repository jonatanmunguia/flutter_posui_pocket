import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoStatusContainer extends StatelessWidget {
  const AplazoStatusContainer(
      {super.key, required this.status, required this.content});
  final StatusContainer status;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: status.backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: content,
    );
  }
}

enum StatusContainer {
  next(backgroundColor: AppTheme.statusColorPending),
  error(backgroundColor: AppTheme.statusColorError),
  historical(backgroundColor: AppTheme.statusColorSuccess),
  pending(backgroundColor: AppTheme.statusColorNormal);

  const StatusContainer({required this.backgroundColor});
  final Color backgroundColor;
}
