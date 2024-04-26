import 'package:crypto_example/app/utils/network/network.dart';
import 'package:crypto_example/domain/models/binance/ticker_model.dart';

import '../domain/models/binance/candelistik_model.dart';

class BinanceService {
  final Network _network = Network();

  final _defaultSymbols = [
    "BTCUSDT",
    "ETHUSDT",
    "BNBUSDT",
    "SOLUSDT",
    "LTCUSDT",
    "ADAUSDT",
    "XRPUSDT",
    "DOGEUSDT",
    "SHIBUSDT"
  ];

  Future<List<TickerModel>> getTickers() async {
    try {
      const url = '/api/v3/ticker/24hr';
      final queryParameters = {
        'symbols': '["${_defaultSymbols.join('","')}"]',
      };
      final response =
          await _network.request().get(url, queryParameters: queryParameters);
      return response.data == null
          ? []
          : List<TickerModel>.from(
              response.data.map((e) => TickerModel.fromMap(e)).toList());
    } catch (err) {
      rethrow;
    }
  }

  Future<List<CandlestickModel>> getCandlestick(
    String symbol,
    String interval,
  ) async {
    try {
      const url = '/api/v3/klines';
      final queryParameters = {
        'symbol': symbol,
        'interval': interval,
      };
      final response =
          await _network.request().get(url, queryParameters: queryParameters);
      return response.data == null
          ? []
          : List<CandlestickModel>.from(
              response.data.map((e) => CandlestickModel.fromList(e)).toList());
    } catch (err) {
      rethrow;
    }
  }
}
