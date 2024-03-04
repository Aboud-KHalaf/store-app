import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 18,
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          !isLiked ? IconlyLight.heart : IconlyBold.heart,
          color: Colors.red,
          size: 24,
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
