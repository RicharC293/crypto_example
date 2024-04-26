import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:crypto_example/app/utils/constants.dart';
import 'package:crypto_example/app/widgets/buttons/button_link.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/notifiers/binance_notifier.dart';

class IntervalSelector extends StatelessWidget {
  const IntervalSelector({super.key});

  void _setInterval(BuildContext context, String interval) {
    context.read<BinanceNotifier>().setInterval(interval);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<BinanceNotifier, String>(
        selector: (_, notifier) => notifier.interval,
        builder: (context, interval, _) {
          return SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: kSpaceDevice0.copyWith(left: spacing6, right: spacing6),
              children: [
                ButtonInterval(
                  interval: '1m',
                  onPressed: (value) => _setInterval(context, value),
                  selectedInterval: interval,
                ),
                const SizedBox(width: spacing2),
                ButtonInterval(
                  interval: '15m',
                  onPressed: (value) => _setInterval(context, value),
                  selectedInterval: interval,
                ),
                const SizedBox(width: spacing2),
                ButtonInterval(
                  interval: '1h',
                  onPressed: (value) => _setInterval(context, value),
                  selectedInterval: interval,
                ),
                const SizedBox(width: spacing2),
                ButtonInterval(
                  interval: '1d',
                  onPressed: (value) => _setInterval(context, value),
                  selectedInterval: interval,
                ),
                const SizedBox(width: spacing2),
                ButtonInterval(
                  interval: '1w',
                  onPressed: (value) => _setInterval(context, value),
                  selectedInterval: interval,
                ),
              ],
            ),
          );
        });
  }
}

class ButtonInterval extends StatelessWidget {
  const ButtonInterval({
    super.key,
    required this.interval,
    required this.onPressed,
    required this.selectedInterval,
  });
  final String interval;
  final ValueChanged<String> onPressed;
  final String selectedInterval;

  @override
  Widget build(BuildContext context) {
    return ButtonLink(
      onPressed: () => onPressed(interval),
      label: interval,
      color: interval != selectedInterval
          ? context.theme.colorScheme.inverseSurface
          : null,
    );
  }
}
