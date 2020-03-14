class PaymentType {

  String type;
  int index;

  PaymentType({this.type, this.index});

  static List<PaymentType> getPaymentTypes() {
    return <PaymentType> [
      PaymentType(index: 1, type: 'MPESA'),
      PaymentType(index: 2, type: 'Cartão Visa Seguro (VBV)'),
      PaymentType(index: 3, type: 'Android Pay'),
      PaymentType(index: 4, type: 'PayPal'),
    ];
  }

}
