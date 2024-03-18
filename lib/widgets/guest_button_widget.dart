import 'package:flutter/material.dart';
import 'package:store_app/root_screen.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
      child: const SubTitleTextWidget(
        lable: 'Guest',
        fontSize: 14,
      ),
      onPressed: () async {
        Navigator.pushReplacementNamed(context, RootScreen.routeName);
      },
    );
  }
}
