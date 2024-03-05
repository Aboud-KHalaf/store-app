import 'package:flutter/material.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/widgets/app_title_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class SignupScreen extends StatefulWidget {
  static const String pageRoute = '/signupScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _confirmPasswordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _nameFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(child: AppTitleWidget()),
                  const SizedBox(height: 20),
                  const TitleTextWidget(
                    title: 'Wellcome',
                    fontSize: 22,
                  ),
                  const SubTitleTextWidget(
                    lable: AppTexts.signup,
                    fontSize: 14,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    hintText: 'Full name',
                    validator: (p0) {},
                    onFieldSubmitted: (p0) {},
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    hintText: 'Email Address',
                    validator: (p0) {},
                    onFieldSubmitted: (p0) {},
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    hintText: 'password',
                    validator: (p0) {},
                    onFieldSubmitted: (p0) {},
                    icon: Icons.password,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    hintText: 'Confirm password',
                    validator: (p0) {},
                    onFieldSubmitted: (p0) {},
                    icon: Icons.password_outlined,
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
                        lable: 'Sign up',
                      ),
                      onPressed: () async {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SubTitleTextWidget(
                        lable: "already have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const SubTitleTextWidget(
                          lable: 'login',
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
