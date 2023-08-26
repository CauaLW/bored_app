import 'package:flutter/material.dart';

class HorizontalDataBar extends StatelessWidget {
  final String label;
  final double value;
  const HorizontalDataBar({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: themeData.textTheme.titleLarge,
        ),
        LinearProgressIndicator(
          value: value,
        ),
      ],
    );
  }
}
