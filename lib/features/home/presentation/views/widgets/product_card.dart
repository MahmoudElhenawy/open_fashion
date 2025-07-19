import 'package:amimooo/features/home/presentation/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          imagePath,
          width: 100,
          height: 133,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(height: 5),
              CustomText(
                text: description,
                max: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        onQuantityChanged(quantity - 1);
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 10),
                  Text(quantity.toString()),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      onQuantityChanged(quantity + 1);
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              CustomText(
                text: '\$${(price * quantity).toStringAsFixed(2)}',
                color: Colors.red.shade200,
              ),
            ],
          ),
        )
      ],
    );
  }
}
