import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_list_tile.dart';
import 'package:store_app/constants/app_images.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowWidget(text: 'elc store'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SubTitleTextWidget(
                  lable: 'Login to save your details, and access your info',
                  maxLines: 2,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.amber,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(AppImages.imagesProfileRecent),
                      radius: 25,
                    ),
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextWidget(title: 'Aboud Khalaf'),
                      SubTitleTextWidget(lable: 'aboud.khalaf.10@gmail.com'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextWidget(title: 'General'),
                  CustomListTile(
                    imageUrl: AppImages.imagesBagOrderSvg,
                    title: 'All orders',
                    ontap: () {},
                  ),
                  CustomListTile(
                    imageUrl: AppImages.imagesBagWishlistSvg,
                    title: 'wishlist',
                    ontap: () {},
                  ),
                  CustomListTile(
                    imageUrl: AppImages.imagesProfileRecent,
                    title: 'Viewed recently',
                    ontap: () {},
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
                        maximumSize: const Size(150, 50),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.exit_to_app_outlined,
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          SubTitleTextWidget(
                            lable: 'log out',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
