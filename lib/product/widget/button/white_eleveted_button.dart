import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class WhiteElevatedButton extends StatelessWidget {
  const WhiteElevatedButton({
    required this.onPressed,
    required this.title,
    super.key,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.general.colorScheme.onSecondary,
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: context.general.textTheme.titleSmall?.copyWith(
            color: context.general.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
