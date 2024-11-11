import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:snap_buy_app/core/service/remote/api/api_keys.dart';
import 'package:snap_buy_app/core/service/remote/stripe/api_service.dart';
import 'package:snap_buy_app/features/shop/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:snap_buy_app/features/shop/data/models/init_payment_sheet_input_model.dart';
import 'package:snap_buy_app/features/shop/data/models/payment_intent_input_model.dart';
import 'package:snap_buy_app/features/shop/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<String> createCustomer(
    {required String id , required String name }) async {
    var response = await apiService.post(
      body: {
        'id': id,
        'name': name,
        
      },
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    return response.data['id'];
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerID}) async {
    var response = await apiService.post(
        body: {'customer': customerID},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType,
        header: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20'
        });
    return EphemeralKeyModel.fromJson(response.data);
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        merchantDisplayName: 'Yousef',
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
   
    var ephemeralKeyModel = await createEphemeralKey(
        customerID: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }
}
