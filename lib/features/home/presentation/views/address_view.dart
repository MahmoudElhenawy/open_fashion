// lib/features/home/presentation/views/address_view.dart

import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_address_text_filed.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:amimooo/features/home/presentation/views/widgets/name_fields_row.dart';
import 'package:amimooo/features/home/presentation/views/widgets/state_zip_row.dart';
import 'package:flutter/material.dart';
import 'package:amimooo/core/utils/styles.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.editData != null) {
      firstNameController.text = widget.editData['first'] ?? "";
      lastNameController.text = widget.editData['last'] ?? "";
      addressController.text = widget.editData['address'] ?? "";
      cityController.text = widget.editData['city'] ?? "";
      stateController.text = widget.editData['state'] ?? "";
      zipCodeController.text = widget.editData['Zip'] ?? "";
      phoneController.text = widget.editData['phone'] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomHomeAppBar(color: Colors.black),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Add Your Address',
                  style: Styles.textStyle40.copyWith(fontFamily: 'Otama.ep'),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      NameFieldsRow(
                        firstController: firstNameController,
                        lastController: lastNameController,
                      ),
                      const SizedBox(height: 30),
                      CustomAddressTextField(
                          label: 'Address', controller: addressController),
                      const SizedBox(height: 30),
                      CustomAddressTextField(
                          label: 'City', controller: cityController),
                      const SizedBox(height: 30),
                      StateZipRow(
                        stateController: stateController,
                        zipController: zipCodeController,
                      ),
                      const SizedBox(height: 30),
                      CustomAddressTextField(
                        label: 'Phone Number',
                        controller: phoneController,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: "Place order",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final data = {
                              'first': firstNameController.text,
                              'last': lastNameController.text,
                              'address': addressController.text,
                              'Zip': zipCodeController.text,
                              'city': cityController.text,
                              'phone': phoneController.text,
                              'state': stateController.text,
                            };
                            Navigator.pop(context, data);
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
