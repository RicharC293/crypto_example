import 'package:crypto_example/domain/models/binance/candelistik_model.dart';
import 'package:crypto_example/services/binance_service.dart';
import 'package:flutter/material.dart';

import '../models/binance/ticker_model.dart';

class BinanceNotifier extends ChangeNotifier {
  BinanceNotifier(this._binanceService);

  final BinanceService _binanceService;

  List<TickerModel>? _tickers;

  List<CandlestickModel>? _candlesticks;

  bool _isLoading = false;

  TickerModel? _ticker;
  String _interval = '1h';

  List<TickerModel>? get tickers => _tickers;

  List<CandlestickModel>? get candlesticks => _candlesticks;

  String get symbol => _ticker?.symbol ?? '';

  String get interval => _interval;

  bool get isLoading => _isLoading;

  void setInterval(String interval) {
    _interval = interval;
    getCandlestick();
    notifyListeners();
  }

  Future<void> getTickers() async {
    try {
      _tickers = await _binanceService.getTickers();
    } catch (err) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  void setTicker(TickerModel ticker) {
    _ticker = ticker;
  }

  Future<void> getCandlestick({bool showLoading = true}) async {
    try {
      if (_ticker?.symbol == null) return;
      if(showLoading) {
        _isLoading = true;
        notifyListeners();
      }
      _candlesticks =
          await _binanceService.getCandlestick(_ticker!.symbol, _interval);
      //select only the first 75
      _candlesticks = _candlesticks!.sublist(0, 75);
    } catch (err) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void cleanCandlesticks() {
    _candlesticks = null;
    _interval = '1h';
    notifyListeners();
  }
}
