import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/widgets/app_title_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class ForgetPassword extends StatefulWidget {
  static const String pageRoute = '/forgetScreen';
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final TextEditingController _controller;

  late final FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: AppTitleWidget()),
                const SizedBox(height: 10),
                Image.asset(
                  AppImages.imagesForgotPassword,
                  width: double.infinity,
                  height: size.height * 0.35,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const TitleTextWidget(
                  title: "Forget password",
                ),
                const SubTitleTextWidget(
                  lable: AppTexts.forgetPassword,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  hintText: 'rouremail@email.com',
                  validator: (v) {
                    return '';
                  },
                  onFieldSubmitted: (v) {},
                  icon: IconlyLight.message,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const SubTitleTextWidget(
                      lable: 'Request Like',
                    ),
                    onPressed: () async {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
