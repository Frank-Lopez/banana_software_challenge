import 'dart:convert';
import 'package:banana_software_challenge/src/models/product_model.dart';
import 'package:http/http.dart' as http;

class ChallengeServices {
  String baseUrl = "https://dummyjson.com";
  Future<dynamic> login(String user, String password) async {
    var url = Uri.parse('$baseUrl/auth/login');
    var response = await http.post(url, body: {
      "usuario": user,
      "contraseña": password,
    });

    if (response.statusCode == 200) {
      print(response);
    }

    // Kminchelle
    // 0lelplR
  }

  Future<List<Product>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final dataList = json.decode(response.body);
      var lst = <Product>[];
      for (var product in dataList["products"]) {
        var pd = Product.fromJson(product);
        lst.add(pd);
      }
      return lst;
    } else {
      print('Error ${response.statusCode} en endpoint de listas de productos');
    }
    return [];
  }

  Future<List<Product>> searchProduct(String query) async {
    var url = Uri.parse('$baseUrl/products/search?q=$query');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final dataList = json.decode(response.body);
      var lst = <Product>[];
      for (var product in dataList["products"]) {
        var pd = Product.fromJson(product);
        lst.add(pd);
      }
      return lst;
    } else {
      print('Error  ${response.statusCode} en endpoint de busqueda ');
    }

    return [];
  }

  Future<Product> getProduct({required int id}) async {
    var url = Uri.parse('$baseUrl/products/$id');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var product = Product.fromJson(data);
      return product;
    } else {
      print('Error ${response.statusCode} en endpoint detalle de producto');
    }

    return Product();
  }
}
