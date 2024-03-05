import 'package:flutter/material.dart';
import 'package:store_app/components/custom_cart_bottom_sheet.dart';
import 'package:store_app/components/custom_cart_widget.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isEmpty;
    // ignore: unnecessary_null_comparison
    return isEmpty != null
        ? CustomEmptyCartWidget(
            image: AppImages.imagesBagShoppingBasket,
            title: AppTexts.woops,
            subTitile: AppTexts.emptyCart,
            text: AppTexts.goShoping,
            buttonText: 'Shop now',
            onPressed: () {},
          )
        : Scaffold(
            bottomSheet: const CustomCartButtomSheet(),
            appBar: AppBar(
              title: const AppBarRowWidget(
                text: 'Cart',
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: (index == 9) ? 55 : 0),
                  child: const CustomCartWidget(),
                );
              },
            ),
          );
  }
}
