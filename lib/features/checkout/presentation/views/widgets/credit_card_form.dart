import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/widgets/custom_form_textfield.dart';
import 'package:grocify/generated/l10n.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({super.key});

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String cardHolder, cardNumber, expiryDate, cvv;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormTextfield(
            hintText: S.current.cardHolder,
            textInputType: TextInputType.name,
            onSaved: (value) => cardHolder = value!,
          ),

          /// Card Number
          CustomFormTextfield(
            hintText: S.current.cardNumber,
            textInputType: TextInputType.number,
            onSaved: (value) => cardNumber = value!,
          ),

          /// Expiry & CVV
          Row(
            children: [
              Expanded(
                child: CustomFormTextfield(
                  hintText: S.current.expiryDate,
                  textInputType: TextInputType.datetime,
                  onSaved: (value) => expiryDate = value!,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomFormTextfield(
                  hintText: S.current.cvv,
                  obscure: true,
                  textInputType: TextInputType.number,
                  onSaved: (value) => cvv = value!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
