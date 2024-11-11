class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  const InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });
}
