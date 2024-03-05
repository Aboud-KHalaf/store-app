import 'package:flutter/material.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/screens/auth/signup_screen.dart';
import 'package:store_app/widgets/app_title_widget.dart';
import 'package:store_app/widgets/google_button_widget.dart';
import 'package:store_app/widgets/guest_button_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class SigninScreen extends StatefulWidget {
  static const String pageRoute = '/signin';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> loginFct() async {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
      } else {
        print('not valid');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(child: AppTitleWidget()),
                  const SizedBox(height: 20),
                  const TitleTextWidget(title: 'Wellcome Back', fontSize: 22),
                  const SubTitleTextWidget(
                    lable: AppTexts.letsLoggedIn,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    icon: Icons.email,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    hintText: 'Email Adress',
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    validator: (value) {
                      if (value == 'aboud') {
                        return 'aboud is your ancle';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    icon: Icons.password,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    hintText: 'password',
                    onFieldSubmitted: (value) {
                      loginFct();
                    },
                    validator: (value) {
                      if (value == '123') {
                        return '123 is weak';
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const SubTitleTextWidget(
                        lable: 'Forget your password?',
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const SubTitleTextWidget(
                        lable: 'Login',
                      ),
                      onPressed: () async {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: SubTitleTextWidget(
                      lable: 'OR CONNECT USING',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GoogleButton(),
                      SizedBox(width: 15),
                      GuestButton(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SubTitleTextWidget(
                        lable: "Don't have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SignupScreen.pageRoute);
                        },
                        child: const SubTitleTextWidget(
                          lable: 'Sign up',
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

//

