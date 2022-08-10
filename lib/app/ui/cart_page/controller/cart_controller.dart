import 'package:get/get.dart';

class CartController extends GetxController {
  Rxn<PaymentForm> selectedPaymentForm = Rxn<PaymentForm>();
}

class PaymentForm {
  int? id;
  String? title;
  PaymentForm({
    this.id,
    this.title = '',
  });
}
