import 'package:flutter/material.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bool isEmpty = true;
    return isEmpty
        ? CustomEmptyCartWidget(
            title: 'Whoops!',
            subTitile: 'Your cart is empty',
            text:
                'Looks like you didn\'t add anything yet to your cart, Go ahead and start shopping now',
            buttonText: 'Shop now',
            onPressed: () {},
          )
        : Scaffold();
  }
}
