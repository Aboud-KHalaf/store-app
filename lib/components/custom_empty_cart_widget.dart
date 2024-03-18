import 'package:flutter/material.dart';
import 'package:store_app/screens/main/search_screen.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class CustomEmptyCartWidget extends StatelessWidget {
  const CustomEmptyCartWidget(
      {super.key,
      required this.title,
      required this.subTitile,
      required this.text,
      required this.buttonText,
      required this.image});

  final String title, subTitile, text, buttonText, image;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset(
                image,
                height: size.height * 0.35,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TitleTextWidget(
                  maxLines: 3,
                  title: title,
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SubTitleTextWidget(
                  lable: subTitile,
                  fontSize: 25,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SubTitleTextWidget(
                  maxLines: 3,
                  fontSize: 20,
                  lable: text,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 8),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SearchScreen.pageRoute);
                },
                child: SubTitleTextWidget(
                  lable: buttonText,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
