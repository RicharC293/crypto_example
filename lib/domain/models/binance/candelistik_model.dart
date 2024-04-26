import 'package:intl/intl.dart';

class CandlestickModel {
  final DateTime openTime;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double closePrice;
  final double volume;
  final DateTime closeTime;
  final double quoteAssetVolume;
  final int numberOfTrades;
  final double takerBuyBaseAssetVolume;
  final double takerBuyQuoteAssetVolume;

  CandlestickModel({
    required this.openTime,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.volume,
    required this.closeTime,
    required this.quoteAssetVolume,
    required this.numberOfTrades,
    required this.takerBuyBaseAssetVolume,
    required this.takerBuyQuoteAssetVolume,
  });

  CandlestickModel copyWith({
    DateTime? openTime,
    double? openPrice,
    double? highPrice,
    double? lowPrice,
    double? closePrice,
    double? volume,
    DateTime? closeTime,
    double? quoteAssetVolume,
    int? numberOfTrades,
    double? takerBuyBaseAssetVolume,
    double? takerBuyQuoteAssetVolume,
  }) =>
      CandlestickModel(
        openTime: openTime ?? this.openTime,
        openPrice: openPrice ?? this.openPrice,
        highPrice: highPrice ?? this.highPrice,
        lowPrice: lowPrice ?? this.lowPrice,
        closePrice: closePrice ?? this.closePrice,
        volume: volume ?? this.volume,
        closeTime: closeTime ?? this.closeTime,
        quoteAssetVolume: quoteAssetVolume ?? this.quoteAssetVolume,
        numberOfTrades: numberOfTrades ?? this.numberOfTrades,
        takerBuyBaseAssetVolume:
            takerBuyBaseAssetVolume ?? this.takerBuyBaseAssetVolume,
        takerBuyQuoteAssetVolume:
            takerBuyQuoteAssetVolume ?? this.takerBuyQuoteAssetVolume,
      );

  // generate model from list
  factory CandlestickModel.fromList(List<dynamic> list) {
    return CandlestickModel(
      openTime: DateTime.fromMillisecondsSinceEpoch(list[0]),
      openPrice: double.parse(list[1]),
      highPrice: double.parse(list[2]),
      lowPrice: double.parse(list[3]),
      closePrice: double.parse(list[4]),
      volume: double.parse(list[5]),
      closeTime: DateTime.fromMillisecondsSinceEpoch(list[6]),
      quoteAssetVolume: double.parse(list[7]),
      numberOfTrades: list[8],
      takerBuyBaseAssetVolume: double.parse(list[9]),
      takerBuyQuoteAssetVolume: double.parse(list[10]),
    );
  }

  double get averagePrice => (highPrice + lowPrice) / 2;

  DateTime get time => openTime;

  String get formattedTime => DateFormat('HH:mm:ss').format(time);
}
