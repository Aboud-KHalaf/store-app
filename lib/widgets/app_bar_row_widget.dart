import 'package:flutter/material.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/widgets/shimmer_text_widget.dart';

class AppBarRowWidget extends StatelessWidget {
  const AppBarRowWidget({
    super.key,
  });

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
        const ShimmerText(
          fontWeight: FontWeight.w600,
          text: 'AB  Store',
        ),
      ],
    );
  }
}
