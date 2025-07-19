import 'package:amimooo/features/home/data/models/product_model.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomImageListView extends StatelessWidget {
  final List<ProductModel> products;

  const CustomImageListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: product.image != null && product.image!.isNotEmpty
                        ? Image.network(
                            product.image!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Icon(Icons.broken_image));
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          )
                        : const Center(child: Icon(Icons.image_not_supported)),
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: product.title ?? '',
                  size: 14,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
