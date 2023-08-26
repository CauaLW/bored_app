import 'package:bored_app/consts.dart';
import 'package:flutter/material.dart';

class ActivityTypeIcon extends StatelessWidget {
  final String type;
  const ActivityTypeIcon({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      children: [
        Icon(
          _getIconFromType(type),
          color: themeData.textTheme.titleLarge!.color,
          size: 30,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        Text(
          type,
          style: themeData.textTheme.titleLarge,
        ),
      ],
    );
  }
}

IconData _getIconFromType(String type) {
  return Consts.typesIcons[type] ?? Icons.lightbulb;
}
