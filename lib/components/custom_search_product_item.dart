import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/screens/inner_screens/product_details_screen.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomSearchProductItem extends StatelessWidget {
  const CustomSearchProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.pageRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FancyShimmerImage(
                imageUrl: AppImages.phone,
                height: size.height * 0.22,
                width: double.infinity,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: SubTitleTextWidget(
                    lable: 'samsung' * 10,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.heart,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 5,
                  child: SubTitleTextWidget(
                    color: Colors.blue,
                    lable: '199\$',
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
