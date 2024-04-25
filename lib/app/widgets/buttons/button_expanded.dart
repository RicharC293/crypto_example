import '/app/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ButtonExpanded extends StatelessWidget {
  const ButtonExpanded({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  /// The text to display in the button.
  final String label;

  /// The function to call when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is in a loading state.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(),
              )
            : Text(
                label,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.primaryColor,
                ),
              ),
      ),
    );
  }
}
