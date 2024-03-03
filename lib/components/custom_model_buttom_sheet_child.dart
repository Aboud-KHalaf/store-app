import 'package:flutter/material.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomModelButtomSheetChild extends StatelessWidget {
  const CustomModelButtomSheetChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            itemCount: 21,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubTitleTextWidget(
                      lable: (index).toString(),
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
