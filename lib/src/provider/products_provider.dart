import 'package:banana_software_challenge/src/models/product_model.dart';
import 'package:banana_software_challenge/src/services/challenge_services.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product>? products;
  Product? product;
  List<Product>? searchPd;

  Future<List<Product>> listProduct() async {
    if (products != null) {
      return products!;
    }
    products = await ChallengeServices().getProducts();
    notifyListeners();
    return products!;
  }

  Future<Product> getProduct(int productId) async {
    if (product?.id != null && product?.id == productId) {
      return product!;
    }
    product = await ChallengeServices().getProduct(id: productId);
    notifyListeners();
    return product!;
  }

  Future<List<Product>> searchProduct(String query) async {
    searchPd = (await ChallengeServices().searchProduct(query));
    notifyListeners();
    return searchPd!;
  }
}
