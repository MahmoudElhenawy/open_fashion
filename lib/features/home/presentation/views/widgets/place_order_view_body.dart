import 'package:amimooo/core/utils/app_routers.dart';
import 'package:amimooo/features/home/presentation/views/widgets/checkout_total_row.dart';
import 'package:amimooo/features/home/presentation/views/widgets/payment_method_section.dart';
import 'package:amimooo/features/home/presentation/views/widgets/shipping_address_section.dart';
import 'package:flutter/material.dart';
import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:go_router/go_router.dart';

class PlaceOrderViewBody extends StatefulWidget {
  const PlaceOrderViewBody({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  State<PlaceOrderViewBody> createState() => _PlaceOrderViewBodyState();
}

class _PlaceOrderViewBodyState extends State<PlaceOrderViewBody> {
  Map<String, String>? addressData;
  Map<String, String>? cardData;

  void updateAddress(Map<String, String> newAddress) {
    setState(() {
      addressData = newAddress;
    });
  }

  void updateCard(Map<String, String> newCard) {
    setState(() {
      cardData = newCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
              ShippingAddressSection(
                addressData: addressData,
                onAddressChanged: updateAddress,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  final result = await GoRouter.of(context)
                      .push<Map<String, String>>(AppRouters.addCardView);
                  if (result != null) {
                    updateCard(result);
                  }
                },
                child: PaymentMethodSection(
                  cardNumber: cardData?['number'],
                ),
              ),
              const SizedBox(height: 70),
              CheckoutTotalRow(totalPrice: widget.totalPrice),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () {
                  String paymentId =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  GoRouter.of(context).push(
                    AppRouters.paymentSuccessView,
                    extra: paymentId,
                  );
                },
                text: 'Checkout',
                icon: Icon(Icons.shopping_bag, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
