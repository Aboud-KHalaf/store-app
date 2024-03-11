import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_text_form_field.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/helpers/app_text.dart';
import 'package:store_app/helpers/app_validator.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/providers/auth_provider.dart';
import 'package:store_app/providers/user_provider.dart';
import 'package:store_app/root_screen.dart';
import 'package:store_app/widgets/app_title_widget.dart';
import 'package:store_app/widgets/pick_image_widget.dart';
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
  XFile? pickedImage;
  bool isLoading = false;

  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
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

  Future<void> localImagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    await AppMethods.showImagepickerDialog(
      context: context,
      cameraFun: () async {
        pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galaryFun: () async {
        pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFun: () {
        setState(() {
          pickedImage = null;
        });
      },
    );
  }

  Future<void> _signUp(
      {required String email, required String password}) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        isLoading = true;
      });
      var res = await Provider.of<MyAuthProvider>(context, listen: false)
          .signUp(email, password);
      res.fold(
          (l) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l))), (r) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Successful sign up')));
        Provider.of<UserProvider>(context, listen: false).setUserInfo(
            userInfo: UserModel(
                userName: _nameController.text,
                createdAt: Timestamp.now(),
                userId: FirebaseAuth.instance.currentUser!.uid,
                userImage: '1',
                userEmail: _emailController.text,
                userCart: [],
                userWish: []));

        if (mounted) {
          Navigator.of(context).pushReplacementNamed(RootScreen.routeName);
        }
      });
      setState(() {
        isLoading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  Center(
                    child: SizedBox(
                      height: size.width * 0.4,
                      width: size.width * 0.4,
                      child: PickImageWidget(
                        pickedImage: pickedImage,
                        function: () async {
                          await localImagePicker();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    hintText: 'Full name',
                    validator: (value) {
                      return AppValidators.displayNamevalidator(value);
                    },
                    onFieldSubmitted: (value) {},
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    hintText: 'Email Address',
                    validator: (value) {
                      return AppValidators.emailValidator(value);
                    },
                    onFieldSubmitted: (value) {},
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    hintText: 'password',
                    validator: (value) {
                      return AppValidators.passwordValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      return;
                    },
                    icon: Icons.password,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    hintText: 'Confirm password',
                    validator: (value) {
                      return AppValidators.repeatPasswordValidator();
                    },
                    onFieldSubmitted: (value) {},
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
                      child: (isLoading)
                          ? const CircularProgressIndicator()
                          : const SubTitleTextWidget(
                              lable: 'Sign up',
                            ),
                      onPressed: () async {
                        _signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                    ),
                  ),
                  const _GoToSignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GoToSignIn extends StatelessWidget {
  const _GoToSignIn();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
