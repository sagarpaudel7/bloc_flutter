import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/models/product_models.dart';
import 'package:bloc_flutter/repo/products_repo.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productsRepo;

  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productsRepo.getProducts();

        emit(ProductsLoadedState(data));
      } catch (e) {
        if (e is SocketException) {
          // ignore: avoid_print
          print("Network error: $e");
          emit(const ProductsErrorState(
              "Network error. Please check your internet connection."));
        } else {
          // ignore: avoid_print
          print("Error in ProductsBloc: $e");
          emit(ProductsErrorState("Failed to load Products:"));
        }
      }
    });
  }
}
