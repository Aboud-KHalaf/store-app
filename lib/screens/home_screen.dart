import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

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
          children: [
            const SizedBox(height: 6),
            SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
