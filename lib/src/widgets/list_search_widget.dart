import 'package:banana_software_challenge/src/models/product_model.dart';
import 'package:banana_software_challenge/src/pages/product_datail_page.dart';
import 'package:banana_software_challenge/src/provider/products_provider.dart';
import 'package:flutter/material.dart';

class ListSearchWidget extends StatelessWidget {
  const ListSearchWidget({
    super.key,
    required this.productsProvider,
    required this.query,
  });

  final ProductsProvider productsProvider;
  final String query;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productsProvider.searchProduct(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;
          return ListView.builder(
            itemCount: products?.length,
            itemBuilder: (context, i) {
              Product pd = products![i];
              return Container(
                child: ListTile(
                  leading: FadeInImage(
                    placeholder: const NetworkImage(
                        "https://tse2.mm.bing.net/th?id=OIP.gimN0SWKqAYykp2mb9vN9wHaFi&pid=Api&P=0&h=180"),
                    image: NetworkImage(pd.thumbnail ?? ""),
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pd.title ?? ""),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          title: pd.title ?? "",
                          productId: pd.id ?? 1,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
        return const Center(
          child: Icon(
            Icons.archive_sharp,
            size: 130,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
