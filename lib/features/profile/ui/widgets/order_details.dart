import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order №1947034",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Tracking number: IW3475453455"),
            const Text("Date: 05-12-2019"),
            const SizedBox(height: 16),
            // List of Items
            Expanded(
              child: ListView(
                children: [
                  ItemTile(
                      name: 'Pullover',
                      color: 'Gray',
                      size: 'L',
                      price: '51\$'),
                  ItemTile(
                      name: 'Pullover',
                      color: 'Gray',
                      size: 'L',
                      price: '51\$'),
                ],
              ),
            ),
            // Order Info
            const Divider(),
            const Text("Order information",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Shipping Address: 3 Newbridge Court, CA 91709, USA"),
            const Text("Payment Method: Visa **34"),
            const Text("Delivery Method: FedEx, 3 days"),
            const Text("Discount: 10% Promo code"),
            const Text("Total Amount: 133\$"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Reorder"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Leave feedback"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String name;
  final String color;
  final String size;
  final String price;
  ItemTile({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_bag),
      title: Text(name),
      subtitle: Text('Color: $color\nSize: $size'),
      trailing: Text(price),
    );
  }
}
