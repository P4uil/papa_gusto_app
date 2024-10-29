import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:papa_gusto_app/components/my_button.dart';
import 'package:papa_gusto_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool cvvFocused = false;

  //user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Подтвердить оплату'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('Номер карты:$cardNumber'),
                      Text('Дата истечения:$expiryDate'),
                      Text('Имя держателя карты:$cardHolderName'),
                      Text('CVV:$cvvCode'),
                    ],
                  ),
                ),
                actions: [
                  //cancel button
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Отмена'),
                  ),

                  //yes button
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeliveryProgressPage(),
                        ),
                      );
                    },
                    child: const Text('Да'),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Чекаут'),
        ),
        body: Column(
          children: [
            //credit card
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: cvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),

            //credit card form
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),

            const Spacer(),

            MyButton(
              onTap: userTappedPay,
              text: 'Оплатить',
            ),

            const SizedBox(height: 25)
          ],
        ));
  }
}
