import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final String label;
  final IconData icon;
  final VoidCallback? onChange;
  final TextInputType? keyBoardType;
  final FocusNode? focusNode;
  const InputWidget(
      {super.key,
      this.controller,
      this.obscureText,
      required this.label,
      required this.icon,
      this.onChange,
      this.focusNode,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        keyboardType: keyBoardType,
        focusNode: focusNode,
        onTap: onChange,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            label: Text(label),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
