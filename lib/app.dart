import 'package:crypto_example/app/screens/welcome_screen/welcome_screen.dart';
import 'package:crypto_example/domain/notifiers/auth_notifier.dart';
import 'package:crypto_example/domain/notifiers/binance_notifier.dart';
import 'package:crypto_example/services/binance_service.dart';
import 'package:crypto_example/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/utils/routes.dart';
import 'app/utils/theme.dart' as theme;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AuthNotifier(DatabaseService.instance)),
          ChangeNotifierProvider(
              create: (context) => BinanceNotifier(BinanceService()))
        ],
        builder: (context, _) {
          return GestureDetector(
            /// Used to improve the user experience by closing the keyboard
            /// when the user taps outside of a text field.
            onTap: () {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: MaterialApp(
              title: 'Crypto App',
              theme: theme.Theme().light(),
              routes: routes,
              initialRoute: WelcomeScreen.routeName,
            ),
          );
        });
  }
}
