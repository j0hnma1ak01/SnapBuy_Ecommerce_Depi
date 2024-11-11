import 'package:flutter/material.dart';

class SquaredImage extends StatelessWidget {
  const SquaredImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.grey.shade100,
            child: Image.asset("assets/images/google.png"),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.grey.shade100,
            child: Image.asset("assets/images/facebook.png"),
          ),
        ],
      ),
    );
  }
}
