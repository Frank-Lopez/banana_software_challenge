import 'package:banana_software_challenge/src/provider/auth_provider.dart';
import 'package:banana_software_challenge/src/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Bienvenido"),
        InputWidget(
          controller: userController,
          label: "Usuario",
          icon: Icons.person,
        ),
        InputWidget(
          controller: passwordController,
          label: "password",
          icon: Icons.lock_outline,
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: () async {
            authProvider.auth(userController.text, passwordController.text);
          },
          child: const Text("Ingresar"),
        )
      ]),
    );
  }

  /*  onLogin() {
    Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProductsPage()),
            );
  } */
}
