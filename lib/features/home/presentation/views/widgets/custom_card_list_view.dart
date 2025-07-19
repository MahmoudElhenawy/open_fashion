import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import 'custom_text.dart';

class CustomCardListView extends StatelessWidget {
  final List<ProductModel> products;
  final void Function(ProductModel)? onTap;

  const CustomCardListView({
    super.key,
    required this.products,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => onTap?.call(product),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: product.title,
                  color: Colors.white,
                  size: 14,
                ),
                const SizedBox(height: 5),
                CustomText(
                  text: product.description ?? '',
                  color: Colors.grey,
                  size: 12,
                  max: 2,
                ),
                const SizedBox(height: 5),
                CustomText(
                  text: '\$${(product.price ?? 0).toStringAsFixed(2)}',
                  color: Colors.red.shade200,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
