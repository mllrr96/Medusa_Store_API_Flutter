class PaymentProvider {
  /// The id of the payment provider as given by the payment service.
  ///
  /// Example: "manual"
  final String? id;

  /// Whether the payment service is installed in the current version. if a payment service is no longer installed, the is_installed attribute is set to false.
  ///
  /// Default: true
  final bool isInstalled;

  PaymentProvider({
    required this.id,
    this.isInstalled = true,
  });

  factory PaymentProvider.fromJson(Map<String, dynamic> json) => PaymentProvider(
        id: json['id'],
        isInstalled: json['is_installed'] ?? true,
      );

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['is_installed'] = isInstalled;
    return json;
  }
}
