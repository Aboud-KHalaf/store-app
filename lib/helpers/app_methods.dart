import 'package:flutter/material.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

abstract class AppMethods {
  static Future<void> showErrorOrWaringDialog({
    required BuildContext context,
    required String subTitle,
    required String image,
    required void Function() fcn,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  image,
                  height: 100,
                ),
                const SizedBox(height: 10),
                SubTitleTextWidget(lable: subTitle),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const SubTitleTextWidget(
                          lable: 'cancle',
                          color: Colors.red,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: fcn,
                      child: const SubTitleTextWidget(
                        lable: 'ok',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
