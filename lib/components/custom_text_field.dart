import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onChanged,
  });
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.red,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
