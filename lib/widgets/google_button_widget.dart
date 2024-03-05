import 'package:flutter/material.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.blue),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.border_all),
          SizedBox(width: 5),
          SubTitleTextWidget(
            lable: 'Sign in with google',
            color: Colors.blue,
          ),
        ],
      ),
      onPressed: () async {},
    );
  }
}
