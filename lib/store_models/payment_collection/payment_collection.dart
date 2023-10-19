import '../store/index.dart';

class PaymentCollection {
  /// The payment collection's id
  ///
  /// Example: "paycol_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? id;

  /// Description of the payment collection
  final String? description;

  /// Amount of the payment collection.
  final int? amount;

  /// Authorized amount of the payment collection.
  final int? authorizedAmount;

  /// The id of the region this payment collection is associated with.
  ///
  /// Example: "reg_01G1G5V26T9H8Y0M4JNE3YGA4G"
  final String? regionId;

  /// The 3 character iso code for the currency this payment collection is associated with.
  ///
  /// Example: "usd"
  final String? currencyCode;

  /// The type of the payment collection
  ///
  /// Example: "order_edit"
  final String? type;

  /// The id of the user that created the payment collection.
  final String? createdBy;

  /// The type of the payment collection
  final PaymentCollectionStatus status;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  /// The details of the region this payment collection is associated with.
  final Region? region;

  /// The details of the currency this payment collection is associated with.
  final Currency? currency;

  /// The details of the payment sessions created as part of the payment collection.
  final PaymentSession? paymentSession;

  /// The details of the payments created as part of the payment collection.
  final List<Payment>? payments;

  PaymentCollection({
    this.id,
    this.description,
    this.amount,
    this.authorizedAmount,
    this.regionId,
    this.currencyCode,
    this.createdBy,
    this.type,
    this.status = PaymentCollectionStatus.awaiting,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
    this.region,
    this.currency,
    this.paymentSession,
    this.payments,
  });

  factory PaymentCollection.fromJson(Map<String, dynamic> json) {
    List<Payment>? payments;
    if (json['payments'] != null) {
      payments = <Payment>[];
      json['payments'].forEach((e) => payments!.add(Payment.fromJson(e)));
    }

    return PaymentCollection(
      id: json['id'],
      description: json['description'],
      amount: json['amount'],
      authorizedAmount: json['authorized_mount'],
      regionId: json['region_id'],
      currencyCode: json['currency_code'],
      createdBy: json['created_by'],
      type: json['type'],
      status: PaymentCollectionStatus.values.where((element) => element.value == json['status']).firstOrNull ??
          PaymentCollectionStatus.awaiting,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
      currency: json['currency'] != null ? Currency.fromJson(json['currency']) : null,
      paymentSession: json['payment_session'] != null ? PaymentSession.fromJson(json['payment_session']) : null,
      payments: payments,
    );
  }
}

enum PaymentCollectionStatus {
  notPaid('not_paid'),
  awaiting('awaiting'),
  authorized('authorized'),
  canceled('canceled'),
  partiallyAuthorized('partially_authorized');

  final String value;

  const PaymentCollectionStatus(this.value);
}
