import 'package:crypto_example/app/screens/login_screen/widgets/forgot_password.dart';
import 'package:crypto_example/app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:crypto_example/app/utils/navigation.dart';
import 'package:crypto_example/app/utils/validators.dart';
import 'package:crypto_example/app/widgets/buttons/button_link.dart';
import 'package:crypto_example/app/widgets/inputs/input_password.dart';
import 'package:crypto_example/app/widgets/messages/messages.dart';
import 'package:crypto_example/domain/notifiers/auth_notifier.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_screen.dart';
import '/app/extensions/build_context_extension.dart';
import '/app/widgets/buttons/button_expanded.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    try {
      await context
          .read<AuthNotifier>()
          .login(email: _email, password: _password);
      if (!mounted) return;
      Navigation.instance.pushNamedAndRemoveUntil(context, const HomeScreen());
    } catch (err) {
      debugPrint("LOGIN_ERROR: $err");
      if (!mounted) return;
      Messages(message: err.toString()).error(context);
    }
  }

  Future<void> _showPasswordAlert() async {
    await showDialog(
      context: context,
      builder: (context) {
        return const ForgotPassword();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: kCanvas6H,
            child: Column(
              children: [
                const SafeArea(child: SizedBox(height: spacing20)),
                Image.asset('assets/images/binance.png', height: 100),
                const SizedBox(height: spacing20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: Validators.instance.email,
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(height: spacing6),
                InputPassword(
                  label: 'Password',
                  hintText: 'Enter your password',
                  validator: Validators.instance.password,
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(height: spacing8),
                Selector<AuthNotifier, bool>(
                    selector: (context, authNotifier) => authNotifier.isLoading,
                    builder: (context, isLoading, _) {
                      return ButtonExpanded(
                        label: 'Login',
                        onPressed: _login,
                        isLoading: isLoading,
                      );
                    }),
                const SizedBox(height: spacing2),
                ButtonLink(
                  label: 'Forgot password?',
                  onPressed: _showPasswordAlert,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: context.textTheme.labelLarge,
            ),
            ButtonLink(
                label: 'Sign up',
                onPressed: () {
                  Navigation.instance.pushNamed(context, const SignUpScreen());
                }),
          ],
        ),
      ),
    );
  }
}
