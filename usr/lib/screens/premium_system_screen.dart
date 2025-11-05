import 'package:flutter/material.dart';
import '../services/mock_trading_service.dart';
import '../models/stock_data.dart';

class PremiumSystemScreen extends StatelessWidget {
  final bool isPremium;
  final VoidCallback onPurchase;

  const PremiumSystemScreen({
    Key? key,
    required this.isPremium,
    required this.onPurchase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isPremium) {
      return Center(
        child: ElevatedButton(
          onPressed: onPurchase,
          child: Text('Unlock Premium System'),
        ),
      );
    } else {
      return FutureBuilder<List<PremiumSignal>>(
        future: MockTradingService.getPremiumSignals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading signals'));
          } else {
            final signals = snapshot.data!;
            return ListView.builder(
              itemCount: signals.length,
              itemBuilder: (context, index) {
                final signal = signals[index];
                return ListTile(
                  leading: Icon(
                    signal.action == 'BUY' ? Icons.arrow_upward : Icons.arrow_downward,
                    color: signal.action == 'BUY' ? Colors.green : Colors.red,
                  ),
                  title: Text('${signal.symbol} ${signal.action}'),
                  subtitle: Text('${signal.timestamp.toLocal()}'),
                );
              },
            );
          }
        },
      );
    }
  }
}
