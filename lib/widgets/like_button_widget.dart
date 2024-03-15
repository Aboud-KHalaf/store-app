import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/wishList_provider.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);
    bool isLiked = wishListProvider.isProductInWishList(productId: productId);

    return GestureDetector(
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          isLiked
              ? wishListProvider.removeWishlistItemFromFirebase(
                  productId: productId)
              : wishListProvider.addToWishlistFirebase(
                  productId: productId, context: context);
        },
        icon: isLiked
            ? const Icon(
                IconlyBold.heart,
                color: Colors.red,
              )
            : const Icon(
                IconlyLight.heart,
                color: Colors.red,
              ),
      ),
    );
  }
}
