import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
    required this.label,
    required this.hintText,
    this.validator,
    this.onSaved,
  });

  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      validator: widget.validator,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
                color: context.theme.colorScheme.inverseSurface),
          )),
    );
  }
}
