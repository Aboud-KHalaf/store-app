import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_leatest_arrivel_item.dart';
import 'package:store_app/helpers/app_animations.dart';
import 'package:store_app/providers/product_provider.dart';

class LeatestArrivalListViewWidget extends StatelessWidget {
  const LeatestArrivalListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.16,
      child: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.getProductList.isEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(AppAnimations.loadingAnimation),
              ],
            );
          } else {
            final products = productProvider.getProductList;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (products.length < 11) ? products.length : 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLeatestArrivalWidget(
                    productItem: products[index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
