import 'package:flutter/material.dart';
import 'package:store_app/components/custom_category_item.dart';
import 'package:store_app/components/custom_leatest_arrivel_item.dart';
import 'package:store_app/components/custom_swiper_widget.dart';
import 'package:store_app/models/caterogy_model.dart';
import 'package:store_app/screens/main/search_screen.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:store_app/widgets/sub_title_text_widget.dart';
import 'package:store_app/widgets/title_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarRowWidget(text: 'ETC Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const CustomSwiperWidget(),
              const SizedBox(height: 10),
              const TitleTextWidget(
                title: 'Leatest arrival',
                fontSize: 24,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.16,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomLeatestArrivalWidget(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              const SubTitleTextWidget(
                lable: 'Categories',
                fontSize: 22,
              ),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: List.generate(
                  categories.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          SearchScreen.pageRoute,
                          arguments: categories[index].text,
                        );
                      },
                      child: CustomCategoryItem(
                        image: categories[index].image,
                        text: categories[index].text,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
