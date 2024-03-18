import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/components/custom_search_product_item.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/models/leatest_arrivel_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/leatest_arrivel_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class ViewedRecently extends StatelessWidget {
  static const String pageRoute = '/viewdRecently';
  const ViewedRecently({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewedRecentProider viewedRecentProider =
        Provider.of<ViewedRecentProider>(context);

    List<ViewedRecentModel> viewedRecentList =
        viewedRecentProider.getViewdRecentList;

    return viewedRecentList.isEmpty
        ? const CustomEmptyCartWidget(
            image: AppImages.imagesProfileRecent,
            title: AppTexts.woops,
            subTitile: AppTexts.emptyWishList,
            text: AppTexts.goShoping,
            buttonText: 'Shop now',
          )
        : Scaffold(
            appBar: AppBar(
              title: const AppBarRowWidget(
                text: 'Viewd recently',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppMethods.showErrorOrWaringDialog(
                      context: context,
                      subTitle: 'Do you realy want to clear history?',
                      image: AppImages.imagesWarning,
                      fcn: () {
                        viewedRecentProider.clearViewdRecent();
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
                itemCount: viewedRecentList.length,
                crossAxisCount: 2,
                builder: (context, index) {
                  ProductModel productItem =
                      Provider.of<ProductProvider>(context)
                          .findByProductId(viewedRecentList[index].productId);
                  return CustomSearchProductItem(
                    productItem: productItem,
                  );
                },
              ),
            ),
          );
  }
}
