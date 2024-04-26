import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:crypto_example/app/utils/constants.dart';
import 'package:crypto_example/domain/notifiers/binance_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/binance/candelistik_model.dart';

class MarketValue extends StatelessWidget {
  const MarketValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kCanvas6H,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Open',
                style: context.textTheme.labelLarge,
              ),
              const SizedBox(width: spacing2),
              Text(
                'Close',
                style: context.textTheme.labelLarge,
              ),
              const SizedBox(width: spacing2),
              Text(
                'Time',
                style: context.textTheme.labelLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: spacing2),
        Selector<BinanceNotifier, List<CandlestickModel>?>(
            selector: (_, notifier) => notifier.candlesticks,
            builder: (context, candlesticks, _) {
              if (candlesticks == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                padding: kCanvas6H,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final candlestick = candlesticks[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${candlestick.openPrice > 0 ? candlestick.openPrice.toStringAsFixed(2) : candlestick.openPrice.toString()}',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: candlestick.closePrice > candlestick.openPrice
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: spacing2),
                      Text(
                        '\$${candlestick.closePrice > 0 ? candlestick.closePrice.toStringAsFixed(2) : candlestick.closePrice.toString()}',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: candlestick.openPrice > candlestick.closePrice
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: spacing2),
                      Text(candlestick.formattedTime),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: spacing2);
                },
                itemCount: candlesticks.length > 20 ? 20 : candlesticks.length,
              );
            }),
      ],
    );
  }
}
