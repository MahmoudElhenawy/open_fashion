import 'package:flutter/material.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_text.dart';

class CheckoutTotalRow extends StatelessWidget {
  final double totalPrice;

  const CheckoutTotalRow({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CustomText(text: 'Est. Total', color: Colors.black),
          const Spacer(),
          CustomText(
            text: '\$${totalPrice.toStringAsFixed(2)}',
            color: Colors.red.shade200,
          ),
        ],
      ),
    );
  }
}
