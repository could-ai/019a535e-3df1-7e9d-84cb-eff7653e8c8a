import 'dart:async';
import '../models/stock_data.dart';

class MockTradingService {
  static Future<List<Stock>> getStocks() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Stock(symbol: 'AAPL', price: 150.0),
      Stock(symbol: 'GOOG', price: 2800.0),
      Stock(symbol: 'TSLA', price: 700.0),
    ];
  }

  static Future<List<IntradayData>> getIntradayData() async {
    await Future.delayed(Duration(seconds: 1));
    final now = DateTime.now();
    return [
      IntradayData(
        symbol: 'AAPL',
        prices: [149.0, 150.5, 151.0, 150.0],
        times: [now.subtract(Duration(minutes: 30)), now.subtract(Duration(minutes: 20)), now.subtract(Duration(minutes: 10)), now],
      ),
      IntradayData(
        symbol: 'GOOG',
        prices: [2790.0, 2805.0, 2810.0, 2800.0],
        times: [now.subtract(Duration(minutes: 30)), now.subtract(Duration(minutes: 20)), now.subtract(Duration(minutes: 10)), now],
      ),
      IntradayData(
        symbol: 'TSLA',
        prices: [690.0, 705.0, 710.0, 700.0],
        times: [now.subtract(Duration(minutes: 30)), now.subtract(Duration(minutes: 20)), now.subtract(Duration(minutes: 10)), now],
      ),
    ];
  }

  static Future<List<PremiumSignal>> getPremiumSignals() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      PremiumSignal(symbol: 'AAPL', action: 'BUY', timestamp: DateTime.now().subtract(Duration(minutes: 5))),
      PremiumSignal(symbol: 'GOOG', action: 'SELL', timestamp: DateTime.now().subtract(Duration(minutes: 3))),
      PremiumSignal(symbol: 'TSLA', action: 'BUY', timestamp: DateTime.now().subtract(Duration(minutes: 1))),
    ];
  }
}
