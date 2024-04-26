import 'package:crypto_example/app/widgets/buttons/button_expanded.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/notifiers/auth_notifier.dart';
import '../../../utils/validators.dart';
import '../../../widgets/messages/messages.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Forgot Password'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
          ),
          validator: Validators.instance.email,
        ),
      ),
      actions: [
        Selector<AuthNotifier, bool>(
            selector: (context, authNotifier) => authNotifier.isLoading,
            builder: (context, isLoading, child) {
              return ButtonExpanded(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();

                  final password = await context
                      .read<AuthNotifier>()
                      .forgotPassword(email: _emailController.text);
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                  Messages(message: 'Your password is: $password')
                      .success(context);
                },
                label: 'Submit',
                isLoading: isLoading,
              );
            }),
      ],
    );
  }
}
