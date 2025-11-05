import 'package:flutter/material.dart';
import '../services/mock_trading_service.dart';
import '../models/stock_data.dart';

class IntradayTradingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IntradayData>>(
      future: MockTradingService.getIntradayData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading intraday data'));
        } else {
          final dataList = snapshot.data!;
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final data = dataList[index];
              final lastPrice = data.prices.last;
              return ListTile(
                leading: Icon(Icons.timeline),
                title: Text(data.symbol),
                subtitle: Text('Last: \$${lastPrice.toStringAsFixed(2)}'),
              );
            },
          );
        }
      },
    );
  }
}
