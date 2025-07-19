import 'package:flutter/material.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_container.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:amimooo/core/utils/app_routers.dart';

class ShippingAddressSection extends StatelessWidget {
  final Map<String, String>? addressData;
  final Function(Map<String, String>) onAddressChanged;

  const ShippingAddressSection({
    super.key,
    required this.addressData,
    required this.onAddressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: 'Shipping address', color: Colors.grey),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: addressData == null
              ? const Text('No address added yet.',
                  style: TextStyle(color: Colors.grey))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '${addressData!['first']} ${addressData!['last']}',
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                        text: addressData!['address'] ?? '',
                        color: Colors.grey),
                    const SizedBox(height: 10),
                    CustomText(
                      text:
                          '${addressData!['city']}, ${addressData!['state']} ${addressData!['Zip']}',
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                        text: addressData!['phone'] ?? '', color: Colors.grey),
                  ],
                ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () async {
            final result =
                await GoRouter.of(context).push(AppRouters.addressView);
            if (result != null) {
              onAddressChanged(Map<String, String>.from(result as Map));
            }
          },
          child: CustomContainer(
            text: addressData == null
                ? 'Add shipping address'
                : 'Edit shipping address',
            icon: Icons.add,
            isFree: false,
          ),
        ),
      ],
    );
  }
}
