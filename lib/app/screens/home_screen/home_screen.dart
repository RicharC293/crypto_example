import 'dart:async';

import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:crypto_example/app/screens/home_screen/widgets/market_card.dart';
import 'package:crypto_example/app/utils/constants.dart';
import 'package:crypto_example/domain/notifiers/binance_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/binance/ticker_model.dart';
import '../../utils/network/connectivity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    /// Connectivity stream
    Connectivity.instance.watch(context);
    context.read<BinanceNotifier>().getTickers();

    /// init timer to simulate realtime updates
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      context.read<BinanceNotifier>().getTickers();
    });
  }

  @override
  void dispose() {
    Connectivity.instance.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kCanvas6H,
          child: Column(
            children: [
              const SizedBox(height: spacing6),
              SvgPicture.asset(
                'assets/svg/bitcoin.svg',
                height: 150,
              ),
              const SizedBox(height: spacing6),
              Row(
                children: [
                  Text(
                    'Markets',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<BinanceNotifier>().getTickers();
                    },
                    icon: const Icon(Icons.refresh),
                  )
                ],
              ),
              Expanded(
                child: Selector<BinanceNotifier, List<TickerModel>?>(
                  selector: (context, notifier) => notifier.tickers,
                  builder: (context, tickers, _) {
                    if (tickers == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final ticker = tickers[index];
                          return MarketCard(ticker: ticker);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: spacing4),
                        itemCount: tickers.length);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
