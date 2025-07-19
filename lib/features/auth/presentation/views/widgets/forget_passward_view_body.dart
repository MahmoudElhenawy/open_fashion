import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_appbar.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_snackBar.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswardViewBody extends StatelessWidget {
  ForgetPasswardViewBody({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: CustomAppbar(
              title: 'Back',
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Forget Your Password ?',
            style: Styles.textStyle20.copyWith(fontFamily: 'Otama.ep'),
          ),
          Text(
            "Please enter the email address associated with your account, and we'll send you a password reset link.",
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 70),
          CustomTextField(
            labelText: 'Email',
            hintText: 'Enter your email',
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 100),
          CustomButton(
            text: 'Send Reset Link',
            onTap: () async {
              final email = emailController.text.trim();
              if (email.isEmpty) {
                CustomSnackBar.show(
                  context,
                  "Please enter your email",
                  backgroundColor: Colors.red,
                );
                return;
              }

              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email);
                CustomSnackBar.show(
                  context,
                  "Password reset link sent to $email",
                  backgroundColor: Colors.green,
                );
              } catch (e) {
                CustomSnackBar.show(
                  context,
                  "Error: ${e.toString()}",
                  backgroundColor: Colors.red,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
