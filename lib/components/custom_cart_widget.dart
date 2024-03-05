import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/components/custom_model_buttom_sheet_child.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/widgets/like_button_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                  imageUrl: AppImages.phone,
                  height: size.height * 0.15,
                  width: size.height * 0.15,
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
                          child: const TitleTextWidget(
                            title: 'samsung',
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: LikeButtonWidget(),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SubTitleTextWidget(
                          lable: '100\$',
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: false,
                              context: context,
                              builder: (context) {
                                return const CustomModelButtomSheetChild();
                              },
                            );
                          },
                          icon: const Icon(
                            IconlyLight.arrowDown2,
                          ),
                          label: const Text("Qty:6"),
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
    );
  }
}
