import 'package:bloc_flutter/bloc/products_bloc.dart';
import 'package:bloc_flutter/repo/products_repo.dart';
import 'package:bloc_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(ProductsRepo()),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
