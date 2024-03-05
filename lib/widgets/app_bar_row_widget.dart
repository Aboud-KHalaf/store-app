import 'package:flutter/material.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/widgets/shimmer_text_widget.dart';

class AppBarRowWidget extends StatelessWidget {
  const AppBarRowWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.imagesBagShoppingCart,
          height: 45,
          width: 45,
        ),
        const SizedBox(width: 8),
        ShimmerText(
          fontWeight: FontWeight.w600,
          text: text,
        ),
      ],
    );
  }
}
