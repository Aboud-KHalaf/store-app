import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:store_app/widgets/like_button_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  static const String pageRoute = '/productdetails';

  @override
  Widget build(BuildContext context) {
    // ThemeProvider provider = Provider.of<ThemeProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowWidget(text: 'Product details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FancyShimmerImage(
              imageUrl: AppImages.phone,
              height: size.height * 0.32,
              width: double.infinity,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'samsung' * 5,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SubTitleTextWidget(
                        lable: '1399.99\$',
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: LikeButtonWidget(),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          maximumSize: const Size(250, 50),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_basket_outlined,
                            ),
                            SizedBox(width: 10),
                            Text('Add to Cart')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextWidget(title: 'Aboud this item'),
                      TitleTextWidget(
                        title: 'in Phones',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('this is product details ' * 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
