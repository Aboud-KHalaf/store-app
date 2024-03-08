import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/wishList_provider.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final WishListProvider wishListProvider =
        Provider.of<WishListProvider>(context);

    return LikeButton(
      padding: EdgeInsets.zero,
      size: 22,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (isLiked) {
        isLiked = wishListProvider.isProductInWishList(productId: productId);
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            wishListProvider.addOrRemoveProductToWishList(productId: productId);
          },
          icon: Icon(
            !isLiked ? IconlyLight.heart : IconlyBold.heart,
            color: Colors.red,
            size: 24,
          ),
        );
      },
      // likeCount: 0,
      // countBuilder: (int count, bool isLiked, String text) {
      //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
      //   Widget result;
      //   if (count == 0) {
      //     result = Text(
      //       "love",
      //       style: TextStyle(color: color),
      //     );
      //   } else
      //     result = Text(
      //       text,
      //       style: TextStyle(color: color),
      //     );
      //   return result;
      // },
    );
  }
}
