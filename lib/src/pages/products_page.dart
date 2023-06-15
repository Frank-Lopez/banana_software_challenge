import 'package:banana_software_challenge/src/delegate/search_product_delegate.dart';
import 'package:banana_software_challenge/src/models/product_model.dart';
import 'package:banana_software_challenge/src/pages/product_datail_page.dart';
import 'package:banana_software_challenge/src/provider/products_provider.dart';
import 'package:banana_software_challenge/src/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Challenge 2023"),
      ),
      body: Column(
        children: [
          InputWidget(
            label: "Buscar producto",
            icon: Icons.search_rounded,
            focusNode: FocusNode(),
            keyBoardType: TextInputType.none,
            onChange: () {
              showSearch(context: context, delegate: SearchProductDelegate());
            },
          ),
          FutureBuilder(
            future: productsProvider.listProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, i) {
                      Product product = data[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                title: product.title ?? "",
                                productId: product.id ?? 1,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(10, 10))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: ListTile(
                                      title: Text(product.title ?? ""),
                                      subtitle: Text(product.brand ?? ""),
                                    ),
                                  ),
                                  Text("USD${product.price}"),
                                ],
                              ),
                              Text(product.description ?? ""),
                              Text("Stock: ${product.stock}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
