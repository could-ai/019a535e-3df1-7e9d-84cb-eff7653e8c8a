import 'package:flutter/material.dart';
import '../services/mock_trading_service.dart';
import '../models/stock_data.dart';

class StockTradingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Stock>>(
      future: MockTradingService.getStocks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading stocks'));
        } else {
          final stocks = snapshot.data!;
          return ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              final stock = stocks[index];
              return ListTile(
                leading: Icon(Icons.show_chart),
                title: Text(stock.symbol),
                trailing: Text('\$${stock.price.toStringAsFixed(2)}'),
              );
            },
          );
        }
      },
    );
  }
}
