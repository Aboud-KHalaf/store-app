import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/components/custom_swiper_widget.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowWidget(text: 'ETC Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const CustomSwiperWidget(),
            const SizedBox(height: 10),
            const TitleTextWidget(
              title: 'Leatest arrival',
              fontSize: 22,
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: size.height * 0.16,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomLeatestArrivalWidget(),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const SubTitleTextWidget(
              lable: 'lable',
              fontSize: 22,
            )
          ],
        ),
      ),
    );
  }
}

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
