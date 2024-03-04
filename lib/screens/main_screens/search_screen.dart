import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:store_app/components/custom_search_product_item.dart';
import 'package:store_app/components/custom_text_field.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class SearchScreen extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const AppBarRowWidget(text: 'Search')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextField(
                controller: textEditingController,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: DynamicHeightGridView(
                  itemCount: 20,
                  crossAxisCount: 2,
                  builder: (context, index) {
                    return const CustomSearchProductItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
