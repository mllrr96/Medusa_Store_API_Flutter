import '../../../enum/enums.dart';
class Refund {
  /// The refund's id
  final String? id;

  /// The id of the order this refund was created for.
  final String? orderId;

  /// The payment's id, if available.
  final String? paymentId;

  /// The amount that has be refunded to the customer.
  final int? amount;

  /// An optional note explaining why the amount was refunded.
  final String? note;

  /// The reason given for the refund, will automatically be set when processed as part of a swap, claim or return.
  final RefundReason? reason;

  /// Randomly generated key used to continue the completion of the refund in case of failure.
  final String? idempotencyKey;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// An optional key-value map with additional details
  Map<String, dynamic>? metadata;

  Refund({
    this.id,
    required this.orderId,
    required this.amount,
    this.note,
    this.reason,
    this.idempotencyKey,
    this.createdAt,
    this.updatedAt,
    this.metadata,
    this.paymentId,
  });

  factory Refund.fromJson(Map<String, dynamic> json) {
    return Refund(
      id: json['id'],
      orderId: json['order_id'],
      amount: json['amount'],
      note: json['note'],
      reason: json['reason'] != null ? RefundReason.values.firstWhere((e) => e.value == (json['reason'] ?? '')) : null,
      idempotencyKey: json['idempotency_key'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['order_id'] = orderId;
    json['amount'] = amount;
    json['note'] = note;
    json['reason'] = reason?.value;
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

