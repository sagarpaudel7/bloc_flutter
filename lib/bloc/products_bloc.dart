import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/models/product_models.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var response =
            await http.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
          emit(ProductsLoadedState(productsModelFromJson(response.body)));
        } else {
          throw Exception("Failed to load Products");
        }
      } catch (e) {
        if (e is SocketException) {
          // ignore: avoid_print
          print("Network error: $e");
          emit(const ProductsErrorState(
              "Network error. Please check your internet connection."));
        } else {
          // ignore: avoid_print
          print("Error in ProductsBloc: $e");
          emit(ProductsErrorState("Failed to load Products: $e"));
        }
      }
    });
  }
}
