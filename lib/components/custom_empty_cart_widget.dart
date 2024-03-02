import 'package:flutter/material.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class CustomEmptyCartWidget extends StatelessWidget {
  const CustomEmptyCartWidget(
      {super.key,
      required this.title,
      required this.subTitile,
      required this.text,
      required this.buttonText,
      required this.onPressed});

  final String title, subTitile, text, buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              AppImages.imagesBagShoppingBasket,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TitleTextWidget(
                title: title,
                fontSize: 50,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SubTitleTextWidget(
                lable: subTitile,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SubTitleTextWidget(
                fontSize: 20,
                lable: text,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 8),
              onPressed: onPressed,
              child: SubTitleTextWidget(
                lable: buttonText,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
