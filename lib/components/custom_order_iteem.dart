import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomOrderWidget extends StatelessWidget {
  const CustomOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      onLongPress: () {},
      child: SizedBox(
        width: double.infinity,
        height: size.height / 7,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FancyShimmerImage(
                imageUrl: AppImages.phone,
                height: size.height * 0.15,
                width: size.height * 0.15,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubTitleTextWidget(
                    lable: 'titel ' * 1,
                    maxLines: 2,
                  ),
                  const SubTitleTextWidget(
                    lable: 'price : 199.9',
                    fontSize: 14,
                    color: Colors.cyan,
                  ),
                  const SubTitleTextWidget(
                    lable: 'Qty : 10',
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
