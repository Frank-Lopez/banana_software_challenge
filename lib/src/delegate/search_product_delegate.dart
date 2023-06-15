import 'package:banana_software_challenge/src/provider/products_provider.dart';
import 'package:banana_software_challenge/src/widgets/list_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProductDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return ListSearchWidget(productsProvider: productsProvider, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return ListSearchWidget(productsProvider: productsProvider, query: query);
  }
}
