import 'package:banana_software_challenge/src/pages/products_page.dart';
import 'package:banana_software_challenge/src/provider/auth_provider.dart';
import 'package:banana_software_challenge/src/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: const Color.fromRGBO(158, 0, 126, 1),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromRGBO(158, 0, 126, 1),
              ),
              buttonTheme: const ButtonThemeData(
                buttonColor: Color.fromRGBO(158, 0, 126, 1),
              )),
          title: 'Material App',
          home: const ProductsPage()
          // ProductDetailPage(),
          ),
    );
  }
}
