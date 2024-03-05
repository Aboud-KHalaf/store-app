import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 10),
      baseColor: Colors.purple,
      highlightColor: Colors.cyan,
      child: const TitleTextWidget(
        fontSize: 38,
        title: AppTexts.appName,
      ),
    );
  }
}
