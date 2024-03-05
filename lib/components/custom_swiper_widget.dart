import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/app_images.dart';

class CustomSwiperWidget extends StatelessWidget {
  const CustomSwiperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.24,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              AppImages.banners[index],
              fit: BoxFit.fill,
            ),
          );
        },
        autoplay: true,
        itemCount: AppImages.banners.length,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
