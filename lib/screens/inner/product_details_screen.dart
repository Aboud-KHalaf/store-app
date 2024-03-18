import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/product_provider.dart';
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
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    ProductModel productItem = productProvider.findByProductId(productId);
    final CartProvider cartProvider = Provider.of(context);
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
            Hero(
              tag: productItem.productImage,
              child: FancyShimmerImage(
                imageUrl: productItem.productImage,
                height: size.height * 0.32,
                width: double.infinity,
                boxFit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          productItem.productTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      SubTitleTextWidget(
                        lable: '${productItem.productPrice}\$',
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          child: LikeButtonWidget(
                        productId: productId,
                      )),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          maximumSize: const Size(250, 50),
                        ),
                        onPressed: () {
                          cartProvider.addToCartFirebase(
                              productId: productId, qty: 1, context: context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              cartProvider.isProductInCart(productId: productId)
                                  ? Icons.check
                                  : Icons.shopping_cart_checkout_outlined,
                              color: Colors.cyan,
                            ),
                            const SizedBox(width: 10),
                            Text(cartProvider.isProductInCart(
                                    productId: productId)
                                ? ' In Cart '
                                : ' Add to Cart '),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleTextWidget(title: 'Aboud this item'),
                      TitleTextWidget(
                        title: 'in ${productItem.productCategory}',
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    productItem.productDescription,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
