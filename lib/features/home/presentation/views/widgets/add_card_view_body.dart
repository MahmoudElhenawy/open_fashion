import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/auth/presentation/views/widgets/custom_bottom.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCardViewBody extends StatefulWidget {
  const AddCardViewBody({super.key});

  @override
  State<AddCardViewBody> createState() => _AddCardViewBodyState();
}

class _AddCardViewBodyState extends State<AddCardViewBody> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isshow = false;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomHomeAppBar(color: Colors.black),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Payment method',
                style: Styles.textStyle40.copyWith(fontFamily: 'Otama.ep'),
              ),
            ),
            const SizedBox(height: 10),
            //visa
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isshow,
              onCreditCardWidgetChange: (v) {},
              cardBgColor: Colors.black,
              obscureCardCvv: false,
              obscureCardNumber: true,
              isHolderNameVisible: true,
            ),

            //form of visa
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: onCreditCardModelChange,
                formKey: _key),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'Add Card',
              onTap: () {
                if (_key.currentState!.validate()) {
                  final data = {
                    'number': cardNumber,
                    'expiryDate': expiryDate,
                    'cardHolderName': cardHolderName,
                    'cvvCode': cvvCode,
                  };
                  Navigator.pop(context, data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardHolderName = data.cardHolderName;
      cardNumber = data.cardNumber;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isshow = data.isCvvFocused;
    });
  }
}
