import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.validator,
    required this.onFieldSubmitted,
    required this.icon,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String) onFieldSubmitted;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.next,
      validator: widget.validator,
      obscureText: (!obscureText && widget.isPassword),
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: Icon(widget.icon),
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              !obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        hintText: widget.hintText,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.orange),
        ),
      ),
    );
  }
}
