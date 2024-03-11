import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_list_tile.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/helpers/app_methods.dart';
import 'package:store_app/providers/auth_provider.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/providers/user_provider.dart';
import 'package:store_app/screens/auth/signin_screen.dart';
import 'package:store_app/screens/inner/all_orders_screen.dart';
import 'package:store_app/screens/inner/viewed_recently.dart';
import 'package:store_app/screens/inner/wish_list_screen.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.fetchUser(FirebaseAuth
          .instance.currentUser!.uid); // Fetch user data on screen load
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    MyAuthProvider authProvider = Provider.of<MyAuthProvider>(context);
    bool isUserLogedIn = authProvider.checkIfUserLogedIn();
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowWidget(text: 'your profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Visibility(
              visible: !isUserLogedIn,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: SubTitleTextWidget(
                  lable: 'Login to save your details, and access your info',
                  maxLines: 2,
                ),
              ),
            ),
            (isUserLogedIn)
                ? Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                    if (userProvider.user == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      final user = userProvider.user!;
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 27,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  AppImages.imagesProfileRecent,
                                ),
                                radius: 25,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleTextWidget(title: user.userName),
                                SubTitleTextWidget(
                                  lable: user.userEmail,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  })
                : const SizedBox(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextWidget(title: 'General'),
                  Visibility(
                    visible: isUserLogedIn,
                    child: CustomListTile(
                      imageUrl: AppImages.imagesBagOrderSvg,
                      title: 'All orders',
                      ontap: () {
                        Navigator.of(context)
                            .pushNamed(AllOrdersScreen.pageRoute);
                      },
                    ),
                  ),
                  Visibility(
                    visible: isUserLogedIn,
                    child: CustomListTile(
                      imageUrl: AppImages.imagesBagWishlistSvg,
                      title: 'wishlist',
                      ontap: () {
                        Navigator.of(context)
                            .pushNamed(WishListScreen.pageRoute);
                      },
                    ),
                  ),
                  CustomListTile(
                    imageUrl: AppImages.imagesProfileRecent,
                    title: 'Viewed recently',
                    ontap: () {
                      Navigator.of(context).pushNamed(ViewedRecently.pageRoute);
                    },
                  ),
                  CustomListTile(
                    imageUrl: AppImages.imagesProfileAddress,
                    title: 'Address',
                    ontap: () {},
                  ),
                  const Divider(thickness: 1),
                  const TitleTextWidget(title: 'Settings'),
                  SwitchListTile(
                    title: const SubTitleTextWidget(
                      lable: 'Dark Mode',
                    ),
                    value: provider.darkTheme,
                    onChanged: (isDark) {
                      provider.setDarkTheme(isDarkTheme: isDark);
                    },
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.exit_to_app_outlined,
                            color: (!isUserLogedIn) ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 10),
                          SubTitleTextWidget(
                            lable: (!isUserLogedIn) ? 'Login' : 'Logout',
                            color: (!isUserLogedIn) ? Colors.green : Colors.red,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        (isUserLogedIn)
                            ? await AppMethods.showErrorOrWaringDialog(
                                context: context,
                                subTitle: 'You will sign out',
                                image: AppImages.imagesWarning,
                                fcn: () {
                                  authProvider.signOut();
                                  Navigator.of(context).pushReplacementNamed(
                                      SigninScreen.pageRoute);
                                },
                              )
                            : Navigator.of(context)
                                .pushReplacementNamed(SigninScreen.pageRoute);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
