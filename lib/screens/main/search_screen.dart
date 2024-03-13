import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_search_product_item.dart';
import 'package:store_app/components/custom_text_field.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String pageRoute = '/searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  List<ProductModel> searchProductList = [];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final String? productCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = productCategory == null
        ? productProvider.getProductList
        : productProvider.findByCategory(ctgName: productCategory);

    return RefreshIndicator(
      onRefresh: () => productProvider.getProductsFuture(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar:
              AppBar(title: AppBarRowWidget(text: productCategory ?? 'Search')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  onChanged: (s) {
                    setState(() {
                      searchProductList = productProvider.searchQuery(
                          searchTxt: s, searchProduct: productList);
                    });
                  },
                  onSubmitted: (s) {
                    setState(() {
                      searchProductList = productProvider.searchQuery(
                          searchTxt: s, searchProduct: productList);
                    });
                  },
                  controller: textEditingController,
                ),
                const SizedBox(height: 8),
                (textEditingController.text.isNotEmpty &&
                        searchProductList.isEmpty)
                    ? const Text('No results ...')
                    : Expanded(
                        child: DynamicHeightGridView(
                          itemCount: searchProductList.isEmpty
                              ? productList.length
                              : searchProductList.length,
                          crossAxisCount: 2,
                          builder: (context, index) {
                            return CustomSearchProductItem(
                              productItem: searchProductList.isEmpty
                                  ? productList[index]
                                  : searchProductList[index],
                            );
                          },
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
