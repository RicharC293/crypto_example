import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key, required this.message});
  final String message;

  void error(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: this,
        backgroundColor: context.errorColor,
      ),
    );
  }

  void info(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: this,
        backgroundColor: context.infoColor,
      ),
    );
  }

  void success(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: this,
        backgroundColor: context.successColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(color: Colors.white),
      maxLines: 2,
    );
  }
}
