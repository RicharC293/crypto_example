import '/app/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ButtonLink extends StatelessWidget {
  const ButtonLink({super.key, required this.label, this.onPressed});

  /// The text to display in the button.
  final String label;

  /// The function to call when the button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.primaryColor,
        ),
      ),
    );
  }
}
