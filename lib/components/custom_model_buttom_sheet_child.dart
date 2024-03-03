import 'package:flutter/material.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomModelButtomSheetChild extends StatelessWidget {
  const CustomModelButtomSheetChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubTitleTextWidget(
                lable: (1 + index).toString(),
                color: Colors.amber,
              ),
            ),
          ),
        );
      },
    );
  }
}
