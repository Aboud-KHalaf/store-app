import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomLeatestArrivalWidget extends StatelessWidget {
  const CustomLeatestArrivalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: size.width * 0.40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                  imageUrl: AppImages.phone,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubTitleTextWidget(
                    lable: 'title' * 10,
                    maxLines: 2,
                    fontSize: 16,
                  ),
                  FittedBox(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart_checkout_outlined,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.heart,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SubTitleTextWidget(
                    lable: '199\$',
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
