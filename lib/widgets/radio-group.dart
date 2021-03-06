import 'package:flutter/material.dart';
import 'package:vogu/models/payment-type.dart';
import 'package:vogu/util/default_colors.dart';

class RadioGroupWidget extends StatefulWidget {
  @override
  _RadioGroupWidgetState createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupWidget> {
  List<PaymentType> paymentTypes;

  PaymentType selectedType;
  int id = 1;

  @override
  void initState() {
    paymentTypes = PaymentType.getPaymentTypes();
    selectedType = paymentTypes[0];
    super.initState();
  }

  setSelectedType(PaymentType type) {
    setState(() {
      selectedType = type;
    });
  }

  List<Widget> createRadioListTypes() {
    List<Widget> widgets = [];
    for (PaymentType paymentType in paymentTypes) {
      widgets.add(SizedBox(
        height: 35.0,
        child: RadioListTile(
          value: paymentType,
          groupValue: selectedType,
          title: Text(paymentType.type),
          onChanged: (currentType) {
            setSelectedType(currentType);
          },
          selected: selectedType == paymentType,
          activeColor: PURPLE_DEEP,
        ),
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: createRadioListTypes(),
    );
  }
}
