import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/screens/inner/product_details_screen.dart';
import 'package:store_app/widgets/like_button_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomLeatestArrivalWidget extends StatelessWidget {
  const CustomLeatestArrivalWidget({
    super.key,
    required this.productItem,
  });

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.pageRoute,
            arguments: productItem.productId);
      },
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: size.width * 0.48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: productItem.productImage,
                  child: FancyShimmerImage(
                    imageUrl: productItem.productImage,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubTitleTextWidget(
                      lable: productItem.productTitle,
                      maxLines: 2,
                      fontSize: 14,
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LikeButtonWidget(
                            productId: productItem.productId,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              cartProvider.addToCartFirebase(
                                  productId: productItem.productId,
                                  qty: 1,
                                  context: context);
                            },
                            icon: Icon(
                              (cartProvider.isProductInCart(
                                      productId: productItem.productId))
                                  ? Icons.check
                                  : Icons.shopping_cart_checkout,
                              size: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SubTitleTextWidget(
                      lable: '${productItem.productPrice} \$',
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
