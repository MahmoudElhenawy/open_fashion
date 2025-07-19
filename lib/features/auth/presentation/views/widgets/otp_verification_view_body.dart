import 'package:amimooo/constens.dart';
import 'package:amimooo/core/utils/app_routers.dart';
import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_appbar.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationViewBody extends StatelessWidget {
  const OtpVerificationViewBody({super.key});

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
            'OTP Verfication',
            style: Styles.textStyle20.copyWith(fontFamily: 'Otama.ep'),
          ),
          Text(
            "Please enter the 4 digit code sent your gmail.",
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 50,
          ),
          OtpTextField(
            margin: const EdgeInsets.all(10),
            numberOfFields: 5,
            borderColor: Colors.grey,
            focusedBorderColor: kpcolor,
            showFieldAsBox: true,
            borderRadius: BorderRadius.circular(8),
            enabledBorderColor: Colors.grey,
            onCodeChanged: (String code) {},
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {}, // end onSubmit
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            text: 'Confirm',
            onTap: () {
              GoRouter.of(context).push(AppRouters.createNewPasswardView);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Resend Code In 00:59",
              style: Styles.textStyle16.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
