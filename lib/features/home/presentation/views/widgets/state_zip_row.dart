// lib/features/home/presentation/views/widgets/state_zip_row.dart

import 'package:flutter/material.dart';
import 'custom_address_text_filed.dart';

class StateZipRow extends StatelessWidget {
  final TextEditingController stateController;
  final TextEditingController zipController;

  const StateZipRow({
    super.key,
    required this.stateController,
    required this.zipController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomAddressTextField(
            label: 'State',
            controller: stateController,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomAddressTextField(
            label: 'ZIP Code',
            controller: zipController,
          ),
        ),
      ],
    );
  }
}
