import 'dart:async';

import 'package:crypto_example/app/screens/symbol_screen/widgets/chart.dart';
import 'package:crypto_example/app/screens/symbol_screen/widgets/interval_selector.dart';
import 'package:crypto_example/app/screens/symbol_screen/widgets/market_value.dart';
import 'package:crypto_example/app/utils/constants.dart';
import 'package:crypto_example/domain/notifiers/binance_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SymbolScreen extends StatefulWidget {
  const SymbolScreen({super.key});

  static const String routeName = '/symbol';

  @override
  State<SymbolScreen> createState() => _SymbolScreenState();
}

class _SymbolScreenState extends State<SymbolScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<BinanceNotifier>().getCandlestick();
      _timer = Timer.periodic(const Duration(seconds: 2), (_) {
        context.read<BinanceNotifier>().getCandlestick(showLoading: false);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<BinanceNotifier>().symbol),
      ),
      body: ListView(
        children: const [
          SizedBox(height: spacing6),
          Chart(),
          SizedBox(height: spacing6),
          IntervalSelector(),
          SizedBox(height: spacing6),
          MarketValue(),
        ],
      ),
    );
  }
}
