import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_cart_bottom_sheet.dart';
import 'package:store_app/components/custom_cart_widget.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of(context);
    List<CartModel> cartList = cartProvider.getCartItems.values.toList();

    return cartList.isEmpty
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
              title: AppBarRowWidget(
                text: 'Cart (${cartList.length})',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppMethods.showErrorOrWaringDialog(
                      context: context,
                      subTitle: 'Do you realy want to clear your cart ?',
                      image: AppImages.imagesWarning,
                      fcn: () {
                        cartProvider.clearCartFromFirebase();
                        Navigator.pop(context);
                      },
                      isError: true,
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: (index == cartProvider.getCartItems.length - 1)
                        ? 55
                        : 0,
                  ),
                  child: CustomCartWidget(
                    cartModel: cartList[index],
                  ),
                );
              },
            ),
          );
  }
}
