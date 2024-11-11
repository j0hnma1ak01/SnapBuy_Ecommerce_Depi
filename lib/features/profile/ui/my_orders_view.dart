import 'package:flutter/material.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Orders List
          OrderTile(
            orderNumber: '№1947034',
            date: '05-12-2019',
            quantity: 3,
            totalAmount: '112\$',
            status: 'Delivered',
            onTap: () {
              context.pushNamed(Routes.orderDetailsScreen);
            },
          ),
          OrderTile(
            orderNumber: '№1947034',
            date: '05-12-2019',
            quantity: 3,
            totalAmount: '112\$',
            status: 'Delivered',
            onTap: () {
              context.pushNamed(Routes.orderDetailsScreen);
            },
          ),
        ],
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final String orderNumber;
  final String date;
  final int quantity;
  final String totalAmount;
  final String status;
  final VoidCallback onTap;
  OrderTile({
    required this.orderNumber,
    required this.date,
    required this.quantity,
    required this.totalAmount,
    required this.status,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Order $orderNumber'),
        subtitle: Text(
            'Tracking number: IW3475453455\nQuantity: $quantity\nTotal Amount: $totalAmount'),
        trailing: Text(status),
        onTap: onTap,
      ),
    );
  }
}
