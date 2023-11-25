import 'package:bloc_flutter/screens/products.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Home",
          ),
        ),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(),
                ),
              );
            },
            child: const Text(
              "Go to Products",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
