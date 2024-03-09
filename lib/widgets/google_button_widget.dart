import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/auth_provider.dart';
import 'package:store_app/root_screen.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.blue),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.border_all),
          //SizedBox(width: 5),
          SubTitleTextWidget(
            lable: 'Sign in with google',
            color: Colors.blue,
          ),
        ],
      ),
      onPressed: () async {
        var res = await authProvider.signInWithGoogle();
        res.fold((l) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l)));
        }, (r) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('google login succesfull')));
          Navigator.of(context).pushReplacementNamed(RootScreen.routeName);
        });
      },
    );
  }
}
