import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class Paypal extends StatefulWidget {
  const Paypal({Key? key}) : super(key: key);

  @override
  State<Paypal> createState() => _PaypalState();
}

class _PaypalState extends State<Paypal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paypal'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => UsePaypal(
                            sandboxMode: true,
                            clientId:
                                "AQX3q6cr6iWb6Tgme96hDy6gH4nFyGO89NrkFjMg4XzWBmgBWM5eG-g0kp9AsR03A0UW44j_9dtFhDt2",
                            secretKey:
                                "EPDWZqYE_v0_JGsCHmJKydybJBxWYoTTICd3ar94PvZ2KM--D43Kouwy1CvIIexeHd7A2bObIX9z_eTz",
                            returnURL: "https://samplesite.com/return",
                            cancelURL: "https://samplesite.com/cancel",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '1.12',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '1.12',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "A demo product",
                                      "quantity": 1,
                                      "price": '1.12',
                                      "currency": "USD"
                                    }
                                  ],

                                  // shipping address is not required though
                                  "shipping_address": {
                                    "recipient_name": "Jane Foster",
                                    "line1": "Travis County",
                                    "line2": "",
                                    "city": "Austin",
                                    "country_code": "US",
                                    "postal_code": "73301",
                                    "phone": "+00000000",
                                    "state": "Texas"
                                  },
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              // print("onSuccess: $params");
                            },
                            onError: (error) {
                              // print("onError: $error");
                            },
                            onCancel: (params) {
                              // print('cancelled: $params');
                            }),
                      ),
                    )
                  },
              child: const Text("Make Payment")),
        ));
  }
}
