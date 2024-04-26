import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../domain/notifiers/auth_notifier.dart';
import '../../../services/database_service.dart';
import '../../../app/extensions/build_context_extension.dart';
import '../../../app/screens/login_screen/login_screen.dart';
import '../../../app/utils/constants.dart';
import '../../../app/utils/navigation.dart';
import '../home_screen/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    /// start local database
    DatabaseService.instance.init();
    Future.microtask(_isLogged);
  }

  void _isLogged() {
    final isLogged = context.read<AuthNotifier>().isAuthenticated;
    if (isLogged) {
      Navigation.instance.pushReplacementNamed(context, const HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: kCanvas6H,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/bitcoin.svg', height: 100),
              const SizedBox(height: spacing20),
              Text('Welcome to the Crypto App!',
                  style: context.textTheme.headlineSmall),
              const SizedBox(height: spacing5),
              ElevatedButton(
                onPressed: () {
                  Navigation.instance
                      .pushReplacementNamed(context, const LoginScreen());
                },
                child: const Text('Let\'s get started!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
