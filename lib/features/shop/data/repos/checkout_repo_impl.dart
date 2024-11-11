import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:snap_buy_app/core/errors/failures.dart';
import 'package:snap_buy_app/core/service/remote/stripe/stripe_service.dart';
import '../models/payment_intent_input_model.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      log('yes');
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
