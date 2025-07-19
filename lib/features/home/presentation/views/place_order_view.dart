import 'package:amimooo/features/home/presentation/views/widgets/place_order_view_body.dart';
import 'package:flutter/material.dart';

class PlaceOrderView extends StatelessWidget {
  final double totalPrice;

  const PlaceOrderView({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceOrderViewBody(totalPrice: totalPrice),
    );
  }
}
