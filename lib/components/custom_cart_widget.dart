import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_model_buttom_sheet_child.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/screens/inner/product_details_screen.dart';
import 'package:store_app/widgets/like_button_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    final String prodtId = cartModel.productId;
    final Size size = MediaQuery.of(context).size;
    final ProductModel productItem =
        Provider.of<ProductProvider>(context).findByProductId(prodtId);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.pageRoute,
          arguments: prodtId,
        );
      },
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: productItem.productImage,
                    child: FancyShimmerImage(
                      imageUrl: productItem.productImage,
                      height: size.height * 0.15,
                      width: size.height * 0.15,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.6,
                            child: TitleTextWidget(
                              title: productItem.productTitle,
                              maxLines: 2,
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeCartItemFromFirebase(
                                    productId: prodtId,
                                    cartId: cartModel.cartId,
                                    qty: cartModel.quantity,
                                  );
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LikeButtonWidget(
                                  productId: prodtId,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubTitleTextWidget(
                            lable: '${productItem.productPrice}\$',
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: false,
                                context: context,
                                builder: (context) {
                                  return CustomModelButtomSheetChild(
                                    productId: cartModel.productId,
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              IconlyLight.arrowDown2,
                            ),
                            label: Text("Qty: ${cartModel.quantity}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
