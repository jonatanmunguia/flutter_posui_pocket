import 'package:flutter/material.dart';

class AplazoContainerCard extends StatelessWidget {
  const AplazoContainerCard(
      {super.key, required this.childrenContent, required this.color});

  final List<Widget> childrenContent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: childrenContent
        )
    );
  }
}