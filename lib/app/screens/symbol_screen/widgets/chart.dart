import 'package:crypto_example/app/extensions/build_context_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/binance/candelistik_model.dart';
import '../../../../domain/notifiers/binance_notifier.dart';
import '../../../utils/constants.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      context.primaryColor.withOpacity(0.2),
      context.primaryColor,
    ];
    return SizedBox(
      height: 300,
      child: Selector<BinanceNotifier, List<CandlestickModel>?>(
        selector: (_, notifier) => notifier.candlesticks,
        builder: (context, candlesticks, _) {
          if (candlesticks == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              Selector<BinanceNotifier, bool>(
                selector: (_, notifier) => notifier.isLoading,
                builder: (context, isLoading, _) {
                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox();
                },
              ),
              Padding(
                padding: kCanvas6H,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(
                      show: false,
                    ),
                    titlesData: const FlTitlesData(
                      show: false,
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: candlesticks
                            .asMap()
                            .entries
                            .map((e) => FlSpot(
                                e.key.toDouble(), e.value.averagePrice.toDouble()))
                            .toList(),
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                        barWidth: 1,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: gradientColors
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
