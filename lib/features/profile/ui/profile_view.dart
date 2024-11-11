import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.popAndPushNamed(context, Routes.loginScreen);
              }),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Info
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/pfp.jpg'),
            // Add this to see a placeholder in case the image isn't loaded
            backgroundColor:
                Colors.grey, // Placeholder color if image doesn't load
          ),
          const SizedBox(height: 16),
          const Text('Matilda Brown',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(FirebaseAuth.instance.currentUser!.email!),
          const SizedBox(height: 20),
          // List of options
          ListTile(
            title: const Text("My orders"),
            subtitle: const Text("Already have 12 orders"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to My Orders Page
              context.pushNamed(Routes.orderScreen);
            },
          ),
          ListTile(
            title: const Text("Shipping addresses"),
            subtitle: const Text("3 addresses"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Payment methods"),
            subtitle: const Text("Visa **34"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Promocodes"),
            subtitle: const Text("You have special promocodes"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text("My reviews"),
            subtitle: const Text("Reviews for 4 items"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Settings"),
            subtitle: const Text("Notifications, password"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // For Profile Page
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Shop'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Bag'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
