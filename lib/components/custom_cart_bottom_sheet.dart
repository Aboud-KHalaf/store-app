import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class CustomCartButtomSheet extends StatelessWidget {
  const CustomCartButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        border: const Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        color: (provider.darkTheme) ? Colors.black : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 10),
          const Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                    child: SubTitleTextWidget(
                        lable: 'Total (6 Products / 9 Items)')),
                SubTitleTextWidget(lable: '12312\$', color: Colors.blue),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {},
              color: Colors.cyan,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: const SubTitleTextWidget(
                fontSize: 16,
                lable: 'Checkout',
              ),
            ),
          )
        ],
      ),
    );
  }
}
