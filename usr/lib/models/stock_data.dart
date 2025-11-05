class Stock {
  final String symbol;
  final double price;

  Stock({required this.symbol, required this.price});
}

class IntradayData {
  final String symbol;
  final List<double> prices;
  final List<DateTime> times;

  IntradayData({
    required this.symbol,
    required this.prices,
    required this.times,
  });
}

class PremiumSignal {
  final String symbol;
  final String action; // 'BUY' or 'SELL'
  final DateTime timestamp;

  PremiumSignal({
    required this.symbol,
    required this.action,
    required this.timestamp,
  });
}
