import 'package:flutter/material.dart';
import 'package:store_app/components/custom_order_iteem.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';

class AllOrdersScreen extends StatelessWidget {
  static const String pageRoute = '/allorders';
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarRowWidget(text: 'All Orders'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomOrderWidget(),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 50,
                endIndent: 60,
              );
            },
          ),
        ));
  }
}
