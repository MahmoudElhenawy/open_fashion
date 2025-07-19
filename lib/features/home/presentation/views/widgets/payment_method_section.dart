// lib/features/home/presentation/views/widgets/payment_method_section.dart

import 'package:flutter/material.dart';
import 'package:amimooo/core/utils/styles.dart';

class PaymentMethodSection extends StatelessWidget {
  final String? cardNumber;

  const PaymentMethodSection({super.key, this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.credit_card, color: Colors.black),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              cardNumber != null
                  ? 'Card: **** ${cardNumber!.substring(cardNumber!.length - 4)}'
                  : 'Add payment method',
              style: Styles.textStyle18,
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
