import 'package:amimooo/core/utils/app_routers.dart';
import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/home/data/models/product_model.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_text.dart';
import 'package:amimooo/features/home/presentation/views/widgets/product_card.dart';
import 'package:amimooo/features/home/presentation/views/widgets/checkout_total_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetilesViewBody extends StatefulWidget {
  final ProductModel product;

  const DetilesViewBody({super.key, required this.product});

  @override
  State<DetilesViewBody> createState() => _DetilesViewBodyState();
}

class _DetilesViewBodyState extends State<DetilesViewBody> {
  int quantity = 1;

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double totalPrice = (widget.product.price.toDouble()) * quantity;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeAppBar(color: Colors.black),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Checkout',
                style: Styles.textStyle40.copyWith(fontFamily: 'Otama.ep'),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProductCard(
                imagePath: widget.product.image ?? '',
                title: widget.product.title,
                description: widget.product.description ?? '',
                price: widget.product.price.toDouble(),
                quantity: quantity,
                onQuantityChanged: updateQuantity,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const Icon(Icons.delivery_dining_rounded),
                  const SizedBox(width: 8),
                  CustomText(
                    text: 'Delivery',
                    color: Colors.black,
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'Free',
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            /// هنا استخدمنا الويجت الجديد
            CheckoutTotalRow(totalPrice: totalPrice),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                onTap: () => GoRouter.of(context).push(
                  AppRouters.placeOrderView,
                  extra: totalPrice,
                ),
                text: 'Checkout',
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
