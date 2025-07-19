// lib/features/home/presentation/views/widgets/name_fields_row.dart

import 'package:flutter/material.dart';
import 'custom_address_text_filed.dart';

class NameFieldsRow extends StatelessWidget {
  final TextEditingController firstController;
  final TextEditingController lastController;

  const NameFieldsRow({
    super.key,
    required this.firstController,
    required this.lastController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomAddressTextField(
            label: 'First name',
            controller: firstController,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomAddressTextField(
            label: 'Last name',
            controller: lastController,
          ),
        ),
      ],
    );
  }
}
