import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.ontap,
  });

  final String title;
  final String imageUrl;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Image.asset(
        imageUrl,
        height: 40,
      ),
      title: SubTitleTextWidget(lable: title),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
