import 'package:flutter/material.dart';
import 'package:store_app/components/custom_cart_widget.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/constants/app_text.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return isEmpty
        ? CustomEmptyCartWidget(
            title: AppTexts.woops,
            subTitile: AppTexts.emptyCart,
            text: AppTexts.goShoping,
            buttonText: 'Shop now',
            onPressed: () {},
          )
        : Scaffold(
            appBar: AppBar(
              title: const AppBarRowWidget(),
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomCartWidget();
              },
            ),
          );
  }
}
