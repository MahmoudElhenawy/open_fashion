import 'package:amimooo/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessView extends StatelessWidget {
  final String paymentId;

  const PaymentSuccessView({super.key, required this.paymentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: Center(
        child: Container(
          width: 343,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue.shade100, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.brown, size: 60),
              const SizedBox(height: 12),
              const Text("PAYMENT SUCCESS",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text("Your payment was success",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text("Payment ID $paymentId",
                  style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 16),
              const Text("Rate your purchase", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_very_dissatisfied, color: Colors.brown),
                  SizedBox(width: 10),
                  Icon(Icons.sentiment_neutral, color: Colors.brown),
                  SizedBox(width: 10),
                  Icon(Icons.sentiment_very_satisfied, color: Colors.brown),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        // Send rating logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Submitted")),
                        );
                      },
                      child: const Text("SUBMIT"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .go(AppRouters.homeView); // عدل حسب الراوتر
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text("BACK TO HOME"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
