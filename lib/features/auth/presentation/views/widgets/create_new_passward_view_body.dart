import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_appbar.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateNewPasswardViewBody extends StatelessWidget {
  CreateNewPasswardViewBody({super.key});
  final TextEditingController NewpasswordController = TextEditingController();
  final TextEditingController ConfirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: CustomAppbar(
              title: 'Cancel',
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Create New Password',
            style: Styles.textStyle20.copyWith(fontFamily: 'Otama.ep'),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            isPassword: true,
            labelText: 'Password',
            hintText: 'Enter your password',
            controller: NewpasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            isPassword: true,
            labelText: 'Password',
            hintText: 'Enter your password',
            controller: ConfirmpasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            text: 'Confirm',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
