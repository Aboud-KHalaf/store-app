import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/components/custom_empty_cart_widget.dart';
import 'package:store_app/helpers/app_images.dart';
import 'package:store_app/models/order_model.dart';
import 'package:store_app/providers/order_provider.dart';
import 'package:store_app/widgets/app_bar_row_widget.dart';
import 'package:store_app/widgets/order_widget_free.dart';

class AllOrdersScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const AppBarRowWidget(text: 'Placed orders'),
        ),
        body: FutureBuilder<List<OrdersModelAdvanced>>(
          future: ordersProvider.fetchOrder(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: SelectableText(
                    "An error has been occured ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || ordersProvider.getOrders.isEmpty) {
              return const CustomEmptyCartWidget(
                image: AppImages.imagesBagOrder,
                title: "Opps",
                text: "No orders has been placed yet",
                buttonText: "Shop now",
                subTitile: 'you have not any orders',
              );
            }
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                  child: OrdersWidgetFree(
                      ordersModelAdvanced: ordersProvider.getOrders[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }),
        ));
  }
}
