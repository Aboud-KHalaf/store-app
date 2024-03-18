import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/helpers/app_animations.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/helpers/app_validator.dart';
import 'package:store_app/providers/auth_provider.dart';
import 'package:store_app/root_screen.dart';
import 'package:store_app/screens/auth/forget_password_screen.dart';
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
  bool isLoading = false;

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

  Future<void> _signIn(
      {required String email, required String password}) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        isLoading = true;
      });
      var res = await Provider.of<MyAuthProvider>(context, listen: false)
          .signIn(email, password);
      res.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l))),
        (r) {
          AppMethods.showSnakBar(
            context,
            "Your have been logged in successfully",
          );

          if (mounted) {
            Navigator.of(context).pushReplacementNamed(RootScreen.routeName);
          }
        },
      );
      setState(() {
        isLoading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                    maxLines: 3,
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
                      return AppValidators.emailValidator(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    icon: Icons.password,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    hintText: 'password',
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      return AppValidators.passwordValidator(value);
                    },
                    isPassword: true,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgetPassword.pageRoute);
                      },
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
                      child: (isLoading)
                          ? LottieBuilder.asset(AppAnimations.loadingAnimation)
                          : const SubTitleTextWidget(
                              lable: 'log in',
                            ),
                      onPressed: () async {
                        _signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
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
                  const _GoT0SignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GoT0SignUp extends StatelessWidget {
  const _GoT0SignUp();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SubTitleTextWidget(
          lable: "Don't have an account?",
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SignupScreen.pageRoute);
          },
          child: const SubTitleTextWidget(
            lable: 'Sign up',
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
