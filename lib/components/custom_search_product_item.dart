import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/leatest_arrivel_provider.dart';
import 'package:store_app/screens/inner/product_details_screen.dart';
import 'package:store_app/widgets/like_button_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomSearchProductItem extends StatelessWidget {
  const CustomSearchProductItem({
    super.key,
    required this.productItem,
  });

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final ViewedRecentProider viewedRecentProider =
        Provider.of<ViewedRecentProider>(context);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.pageRoute,
            arguments: productItem.productId);
        viewedRecentProider.addProductToViewedRecent(
          productId: productItem.productId,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FancyShimmerImage(
                imageUrl: productItem.productImage,
                height: size.height * 0.22,
                width: double.infinity,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: SubTitleTextWidget(
                    lable: productItem.productTitle,
                  ),
                ),
                Flexible(
                  child: LikeButtonWidget(
                    productId: productItem.productId,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: SubTitleTextWidget(
                    color: Colors.blue,
                    lable: '${productItem.productPrice}\$',
                  ),
                ),
                Flexible(
                  child: CircleAvatar(
                    backgroundColor: Colors.cyan,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        cartProvider.addToCartFirebase(
                          productId: productItem.productId,
                          qty: 1,
                          context: context,
                        );
                      },
                      icon: Icon(
                        (cartProvider.isProductInCart(
                                productId: productItem.productId))
                            ? Icons.check
                            : Icons.shopping_cart_checkout,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
