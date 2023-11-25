import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Products",
          ),
        ),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Products",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
