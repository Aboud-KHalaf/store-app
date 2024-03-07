import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomModelButtomSheetChild extends StatelessWidget {
  const CustomModelButtomSheetChild({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return Column(
      children: [
        Container(
          height: 8,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  cartProvider.updateQuantity(
                      productId: productId, quantity: index + 1);
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubTitleTextWidget(
                      lable: (index + 1).toString(),
                      color: Colors.cyan,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
