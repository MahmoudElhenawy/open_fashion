import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isFree;

  const CustomContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(100),
      ),
      width: double.infinity,
      child: Row(
        children: [
          CustomText(text: text, color: Colors.black),
          const Spacer(),
          if (isFree) ...[
            const CustomText(text: "FREE", color: Colors.black),
            const SizedBox(
              height: 15,
            ), // أو SizedBox(width: 15),
          ],
          Icon(icon),
        ],
      ),
    );
  }
}
