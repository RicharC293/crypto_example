import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:crypto_example/app/screens/home_screen/home_screen.dart';
import 'package:crypto_example/app/screens/login_screen/login_screen.dart';
import 'package:crypto_example/app/utils/navigation.dart';
import 'package:crypto_example/app/utils/validators.dart';
import 'package:crypto_example/app/widgets/inputs/input_password.dart';
import 'package:crypto_example/app/widgets/messages/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/notifiers/auth_notifier.dart';
import '../../utils/constants.dart';
import '../../widgets/buttons/button_expanded.dart';
import '../../widgets/buttons/button_link.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (_password != _confirmPassword) {
      const Messages(message: 'Passwords do not match').info(context);
      return;
    }
    try {
      await context
          .read<AuthNotifier>()
          .register(email: _email, password: _password);
      if (!mounted) return;
      Navigation.instance.pushNamedAndRemoveUntil(context, const HomeScreen());
    } catch (err) {
      debugPrint("SIGNUP_ERROR: $err");
      if (!mounted) return;
      Messages(message: err.toString()).error(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kCanvas6H,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: spacing20 - kToolbarHeight),
                Image.asset('assets/images/binance.png', height: 100),
                const SizedBox(height: spacing20),
                Text(
                  'Enter your data to sign up',
                  style: context.textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: spacing6),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: Validators.instance.email,
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: spacing6),
                InputPassword(
                  label: 'Password',
                  hintText: 'Enter your password',
                  validator: Validators.instance.password,
                  onSaved: (value) => _password = value!,
                ),
                const SizedBox(height: spacing6),
                InputPassword(
                  label: 'Confirm Password',
                  hintText: 'Confirm your password',
                  validator: Validators.instance.password,
                  onSaved: (value) => _confirmPassword = value!,
                ),
                const SizedBox(height: spacing8),
                Selector<AuthNotifier, bool>(
                  selector: (context, authNotifier) => authNotifier.isLoading,
                  builder: (context, isLoading, _) => ButtonExpanded(
                    label: 'Sign Up',
                    onPressed: _signUp,
                    isLoading: isLoading,
                  ),
                ),
                const SizedBox(height: spacing2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: context.textTheme.labelLarge,
                    ),
                    ButtonLink(
                      label: 'Login',
                      onPressed: () {
                        Navigation.instance
                            .pushReplacementNamed(context, const LoginScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
