import '../common/return_item.dart';
import 'index.dart';

class Return {
  /// The return's id
  ///
  /// Example: "ret_01F0YET7XPCMF8RZ0Y151NZV2V"Copy to Clipboard
  final String? id;

  /// Status of the return.
  final ReturnStatus status;

  /// The details of the items that the customer is returning.
  final List<ReturnItem>? items;

  /// The id of the swap that the return may belong to.
  final String? swapId;

  /// The details of the swap that the return may belong to.
  final Swap? swap;

  /// The id of the order that the return was created for.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  /// The id of the stock location the return will be added back.
  ///
  /// Example: "sloc_01G8TJSYT9M6AVS5N4EMNFS1EK"Copy to Clipboard
  final String? locationId;

  /// The details of the order that the return was created for.
  final Order? order;

  /// The id of the claim that the return may belong to.
  final String? claimOrderId;

  /// The details of the claim that the return may belong to.
  final ClaimOrder? claimOrder;

  /// The details of the shipping method that will be used to send the return back. can be null if the customer will handle the return shipment themselves.
  final List<ShippingMethod>? shippingMethod;

  /// Data about the return shipment as provided by the fulfilment provider that handles the return shipment.
  final Map<String, dynamic>? shippingData;

  /// The amount that should be refunded as a result of the return.
  ///
  /// Example: 1000
  final int? refundAmount;

  /// When set to true, no notification will be sent related to this return.
  final bool? noNotification;

  /// Randomly generated key used to continue the completion of the return in case of failure.
  final String? idempotencyKey;

  /// The date with timezone at which the return was received.
  final DateTime? receivedAt;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Return({
    this.id,
    this.status = ReturnStatus.requested,
    this.items,
    this.swapId,
    this.locationId,
    this.swap,
    this.orderId,
    this.order,
    this.claimOrderId,
    this.claimOrder,
    this.shippingMethod,
    this.shippingData,
    required this.refundAmount,
    this.noNotification,
    this.idempotencyKey,
    this.receivedAt,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory Return.fromJson(Map<String, dynamic> json) {
    List<ReturnItem>? items;
    List<ShippingMethod>? shippingMethod;

    if (json['items'] != null) {
      items = <ReturnItem>[];
      json['items'].forEach((e) => items!.add(ReturnItem.fromJson(json['items'])));
    }

    if (json['shipping_method'] != null) {
      shippingMethod = <ShippingMethod>[];
      json['shipping_method'].forEach((e) => shippingMethod!.add(ShippingMethod.fromJson(json['shipping_method'])));
    }

    return Return(
      id: json['id'],
      status: ReturnStatus.values.where((e) => e.value == (json['status'] ?? '')).firstOrNull ?? ReturnStatus.requested,
      swapId: json['swap_id'],
      swap: json['swap'] != null ? Swap.fromJson(json['swap']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      claimOrderId: json['claim_order_id'],
      claimOrder: json['claim_order'] != null ? ClaimOrder.fromJson(json['claim_order']) : null,
      shippingData: json['shipping_data'],
      refundAmount: json['refund_amount'],
      noNotification: json['no_notification'],
      idempotencyKey: json['idempotency_key'],
      receivedAt: DateTime.tryParse(json['received_at'] ?? ''),
      createdAt: DateTime.tryParse(json['received_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['received_at'] ?? ''),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status.value;
    json['items'] = items?.map((e) => e.toJson()).toList();
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson();
    json['shipping_method'] = shippingMethod?.map((e) => e.toJson()).toList();
    json['shipping_data'] = shippingData;
    json['refund_amount'] = refundAmount;
    json['no_notification'] = noNotification;
    json['idempotency_key'] = idempotencyKey;
    json['received_at'] = receivedAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ReturnStatus {
  requested('requested'),
  received('received'),
  requiresAction('requires_action'),
  canceled('canceled');

  final String value;

  const ReturnStatus(this.value);
}
