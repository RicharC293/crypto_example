class TickerModel {
  final String symbol;
  final String priceChange;
  final String priceChangePercent;
  final String weightedAvgPrice;
  final String prevClosePrice;
  final String lastPrice;
  final String lastQty;
  final String bidPrice;
  final String bidQty;
  final String askPrice;
  final String askQty;
  final String openPrice;
  final String highPrice;
  final String lowPrice;
  final String volume;
  final String quoteVolume;
  final int openTime;
  final int closeTime;
  final int firstId;
  final int lastId;
  final int count;

  TickerModel({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
    required this.prevClosePrice,
    required this.lastPrice,
    required this.lastQty,
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.openTime,
    required this.closeTime,
    required this.firstId,
    required this.lastId,
    required this.count,
  });

  /// Factory constructor to parse from api response
  factory TickerModel.fromMap(Map<String, dynamic> json) {
    return TickerModel(
      symbol: json['symbol'] ?? '',
      priceChange: json['priceChange'] ?? '',
      priceChangePercent: json['priceChangePercent'] ?? '',
      weightedAvgPrice: json['weightedAvgPrice'] ?? '',
      prevClosePrice: json['prevClosePrice'] ?? '',
      lastPrice: json['lastPrice'] ?? '',
      lastQty: json['lastQty'] ?? '',
      bidPrice: json['bidPrice'] ?? '',
      bidQty: json['bidQty'] ?? '',
      askPrice: json['askPrice'] ?? '',
      askQty: json['askQty'] ?? '',
      openPrice: json['openPrice'] ?? '',
      highPrice: json['highPrice'] ?? '',
      lowPrice: json['lowPrice'] ?? '',
      volume: json['volume'] ?? '',
      quoteVolume: json['quoteVolume'] ?? '',
      openTime: json['openTime'] ?? '',
      closeTime: json['closeTime'] ?? '',
      firstId: json['firstId'] ?? 0,
      lastId: json['lastId'] ?? 0,
      count: json['count'] ?? 0,
    );
  }

  /// Convert to map
  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'priceChange': priceChange,
      'priceChangePercent': priceChangePercent,
      'weightedAvgPrice': weightedAvgPrice,
      'prevClosePrice': prevClosePrice,
      'lastPrice': lastPrice,
      'lastQty': lastQty,
      'bidPrice': bidPrice,
      'bidQty': bidQty,
      'askPrice': askPrice,
      'askQty': askQty,
      'openPrice': openPrice,
      'highPrice': highPrice,
      'lowPrice': lowPrice,
      'volume': volume,
      'quoteVolume': quoteVolume,
      'openTime': openTime,
      'closeTime': closeTime,
      'firstId': firstId,
      'lastId': lastId,
      'count': count,
    };
  }

  /// Copy with new values
  TickerModel copyWith({
    String? symbol,
    String? priceChange,
    String? priceChangePercent,
    String? weightedAvgPrice,
    String? prevClosePrice,
    String? lastPrice,
    String? lastQty,
    String? bidPrice,
    String? bidQty,
    String? askPrice,
    String? askQty,
    String? openPrice,
    String? highPrice,
    String? lowPrice,
    String? volume,
    String? quoteVolume,
    int? openTime,
    int? closeTime,
    int? firstId,
    int? lastId,
    int? count,
  }) {
    return TickerModel(
      symbol: symbol ?? this.symbol,
      priceChange: priceChange ?? this.priceChange,
      priceChangePercent: priceChangePercent ?? this.priceChangePercent,
      weightedAvgPrice: weightedAvgPrice ?? this.weightedAvgPrice,
      prevClosePrice: prevClosePrice ?? this.prevClosePrice,
      lastPrice: lastPrice ?? this.lastPrice,
      lastQty: lastQty ?? this.lastQty,
      bidPrice: bidPrice ?? this.bidPrice,
      bidQty: bidQty ?? this.bidQty,
      askPrice: askPrice ?? this.askPrice,
      askQty: askQty ?? this.askQty,
      openPrice: openPrice ?? this.openPrice,
      highPrice: highPrice ?? this.highPrice,
      lowPrice: lowPrice ?? this.lowPrice,
      volume: volume ?? this.volume,
      quoteVolume: quoteVolume ?? this.quoteVolume,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      firstId: firstId ?? this.firstId,
      lastId: lastId ?? this.lastId,
      count: count ?? this.count,
    );
  }

  String get baseAsset => symbol.split('USDT').first;

  String get quoteAsset => symbol.split('USDT').last;

  String get lastPriceFormatted {
    final price = double.tryParse(lastPrice) ?? 0.0;
    if (price >= 1) {
      return price.toStringAsFixed(2);
    } else {
      return price.toString();
    }
  }
}
