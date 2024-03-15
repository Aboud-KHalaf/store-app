import 'package:flutter/material.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

abstract class AppMethods {
  static void showSnakBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 24,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(16),
        ),
        duration: const Duration(seconds: 3),
        showCloseIcon: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  image,
                  height: 100,
                ),
                const SizedBox(height: 10),
                SubTitleTextWidget(
                  lable: subTitle,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: (!isError)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    (isError)
                        ? TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const SubTitleTextWidget(
                              lable: 'cancle',
                              color: Colors.red,
                            ),
                          )
                        : const SizedBox(),
                    TextButton(
                      onPressed: fcn,
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
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

  //  //  //  //  //  //  //  //  //  //  //  //  //  //

  static Future<void> showImagepickerDialog({
    required BuildContext context,
    required Function cameraFun,
    required Function galaryFun,
    required Function removeFun,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: SubTitleTextWidget(
              lable: 'Choose option',
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextButton.icon(
                  onPressed: () {
                    cameraFun();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                ),
                TextButton.icon(
                  onPressed: () {
                    galaryFun();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Gallery'),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeFun();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Remove'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
