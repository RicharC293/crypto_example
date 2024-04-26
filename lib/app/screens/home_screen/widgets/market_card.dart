import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:crypto_example/app/screens/symbol_screen/symbol_screen.dart';
import 'package:crypto_example/app/utils/constants.dart';
import 'package:crypto_example/app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/binance/ticker_model.dart';
import '../../../../domain/notifiers/binance_notifier.dart';

class MarketCard extends StatelessWidget {
  const MarketCard({super.key, required this.ticker});
  final TickerModel ticker;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.read<BinanceNotifier>().setTicker(ticker);
          context.read<BinanceNotifier>().cleanCandlesticks();
          Navigation.instance.pushNamed(context, const SymbolScreen());
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: kSpaceDevice2.copyWith(left: spacing6, right: spacing6),
          child: Row(
            children: [
              Image.asset(
                'assets/logo/${ticker.symbol}.png',
                height: 25,
                errorBuilder: (_, __, ___) =>
                    Image.asset('assets/logo/UNKNOWN.png', height: 25),
              ),
              const SizedBox(width: spacing2),
              SizedBox(
                width: 80,
                child: Text(
                  ticker.baseAsset,
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: spacing2),
              Expanded(child: Text('\$${ticker.lastPriceFormatted}')),
              const SizedBox(width: spacing2),
              Text(
                '${ticker.priceChangePercent}%',
                style: context.textTheme.labelLarge?.copyWith(
                  color: ticker.priceChangePercent.startsWith('-')
                      ? Colors.red
                      : Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
