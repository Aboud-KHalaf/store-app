import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (searchText) {},
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
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
