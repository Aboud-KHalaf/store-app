import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/components/custom_search_product_item.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/models/with_model.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/providers/wishList_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class WishListScreen extends StatelessWidget {
  static const String pageRoute = '/wishlist';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);
    List<WishModel> wishList = wishListProvider.getCartItems.values.toList();

    // ignore: unnecessary_null_comparison
    return wishList.isEmpty
        ? CustomEmptyCartWidget(
            image: AppImages.imagesBagBagWish,
            title: AppTexts.woops,
            subTitile: AppTexts.emptyWishList,
            text: AppTexts.goShoping,
            buttonText: 'Shop now',
            onPressed: () {},
          )
        : Scaffold(
            appBar: AppBar(
              title: const AppBarRowWidget(
                text: 'Wish list',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppMethods.showErrorOrWaringDialog(
                      context: context,
                      subTitle: 'Do you realy want to clear your wish list ?',
                      image: AppImages.imagesWarning,
                      fcn: () {
                        wishListProvider.clearWishList();
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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                itemCount: wishList.length,
                crossAxisCount: 2,
                builder: (context, index) {
                  ProductModel productItem =
                      Provider.of<ProductProvider>(context)
                          .findByProductId(wishList[index].productId);
                  return CustomSearchProductItem(
                    productItem: productItem,
                  );
                },
              ),
            ),
          );
  }
}
