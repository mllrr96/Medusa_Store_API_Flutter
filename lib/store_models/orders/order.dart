import '../store/index.dart';

class Order {
  /// The order's id
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? id;

  /// The order's status
  final OrderStatus status;

  /// The order's fulfillment status
  final FulfillmentStatus fulfillmentStatus;

  /// The order's payment status
  final PaymentStatus paymentStatus;

  /// The order's display id
  final int? displayId;

  /// The id of the cart associated with the order
  ///
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  final String? cartId;

  /// The details of the cart associated with the order.
  final Cart? cart;

  /// The id of the customer associated with the order
  ///
  /// Example: "cus_01G2SG30J8C85S4A5CHM2S1NS2"
  final String? customerId;

  /// The details of the customer associated with the order.
  final Customer? customer;

  /// The email associated with the order
  final String? email;

  /// The id of the billing address associated with the order
  ///
  /// Example: "addr_01G8ZH853YPY9B94857DY91YGW"
  final String? billingAddressId;

  /// The details of the billing address associated with the order.
  final Address? billingAddress;

  /// The id of the shipping address associated with the order
  ///
  /// Example: "addr_01G8ZH853YPY9B94857DY91YGW"
  final String? shippingAddressId;

  /// The details of the shipping address associated with the order.
  final Address? shippingAddress;

  /// The id of the region this order was created in.
  ///
  /// Example: "reg_01G1G5V26T9H8Y0M4JNE3YGA4G"
  final String? regionId;

  /// The details of the region this order was created in.
  final Region? region;

  /// The 3 character currency code that is used in the order
  ///
  /// Example: "usd"
  final String? currencyCode;

  /// The details of the currency used in the order.
  final Currency? currency;

  /// The order's tax rate
  final num? taxRate;

  /// The details of the discounts applied on the order.
  final List<Discount>? discounts;

  /// The details of the gift card used in the order.
  final List<GiftCard>? giftCards;

  /// The details of the shipping methods used in the order.
  final List<ShippingMethod>? shippingMethods;

  /// The details of the payments used in the order.
  final List<Payment>? payments;

  /// The details of the fulfillments created for the order.
  final List<Fulfillment>? fulfillments;

  /// The details of the returns created for the order.
  final List<Return>? returns;

  /// The details of the claims created for the order.
  final List<ClaimOrder>? claims;

  /// The details of the refunds created for the order.
  final List<Refund>? refunds;

  /// The details of the swaps created for the order.
  final List<Swap>? swaps;

  /// The id of the draft order this order was created from.
  final String? draftOrderId;

  /// The details of the draft order this order was created from.
  final DraftOrder? draftOrder;

  /// The details of the line items that belong to the order.
  final List<LineItem>? items;

  /// The details of the line items that are returnable as part of the order, swaps, or claims
  final List<LineItem>? returnableItems;

  /// The gift card transactions made in the order.
  final List<GiftCardTransaction>? giftCardTransactions;

  /// The date the order was canceled on.
  final DateTime? canceledAt;

  /// Flag for describing whether or not notifications related to this should be send.
  final bool noNotification;

  /// Randomly generated key used to continue the processing of the order in case of failure.
  final String? idempotencyKey;

  /// The id of an external order.
  final String? externalId;

  /// The id of the sales channel this order belongs to.
  final String? salesChannelId;

  /// The details of the sales channel this order belongs to.
  final SalesChannel? salesChannel;

  /// The total of shipping
  final int? shippingTotal;

  /// The total of discount rounded
  final int? discountTotal;

  /// The total of discount
  final int? rawDiscountTotal;

  /// The total of tax
  final int? taxTotal;

  /// The total amount refunded if the order is returned.
  final int? refundedTotal;

  /// The total amount of the order
  final int? total;

  /// The subtotal of the order
  final int? subTotal;

  /// The total amount paid
  final int? paidTotal;

  /// The amount that can be refunded
  final int? refundableAmount;

  /// The total of gift cards
  final int? giftCardTotal;

  /// The total of gift cards with taxes
  final int? giftCardTaxTotal;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Order({
    this.id,
    this.status = OrderStatus.pending,
    this.fulfillmentStatus = FulfillmentStatus.notFulfilled,
    this.paymentStatus = PaymentStatus.notPaid,
    this.displayId,
    this.cartId,
    this.cart,
    required this.customerId,
    this.customer,
    required this.email,
    this.billingAddressId,
    this.billingAddress,
    this.shippingAddressId,
    this.shippingAddress,
    required this.regionId,
    this.region,
    required this.currencyCode,
    this.currency,
    this.taxRate,
    this.discounts,
    this.giftCards,
    this.shippingMethods,
    this.payments,
    this.fulfillments,
    this.returns,
    this.claims,
    this.refunds,
    this.swaps,
    this.draftOrderId,
    this.draftOrder,
    this.items,
    this.giftCardTransactions,
    this.canceledAt,
    this.noNotification = false,
    this.idempotencyKey,
    this.externalId,
    this.salesChannelId,
    this.salesChannel,
    this.shippingTotal,
    this.discountTotal,
    this.taxTotal,
    this.refundedTotal,
    this.total,
    this.subTotal,
    this.paidTotal,
    this.refundableAmount,
    this.giftCardTotal,
    this.giftCardTaxTotal,
    this.returnableItems,
    this.rawDiscountTotal,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<Discount>? discounts;
    List<GiftCard>? giftCards;
    List<ShippingMethod>? shippingMethods;
    List<Fulfillment>? fulfillments;
    List<Return>? returns;
    List<ClaimOrder>? claims;
    List<Refund>? refunds;
    List<Swap>? swaps;
    List<LineItem>? items;
    List<LineItem>? returnableItems;
    List<GiftCardTransaction>? giftCardTransactions;
    List<Payment>? payments;

    if (json['discounts'] != null) {
      discounts = <Discount>[];
      json['discounts'].forEach((e) => discounts!.add(Discount.fromJson(e)));
    }
    if (json['payments'] != null) {
      payments = <Payment>[];
      json['payments'].forEach((e) => payments!.add(Payment.fromJson(e)));
    }
    if (json['gift_cards'] != null) {
      giftCards = <GiftCard>[];
      json['gift_cards'].forEach((e) => giftCards!.add(GiftCard.fromJson(e)));
    }
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods'].forEach((e) => shippingMethods!.add(ShippingMethod.fromJson(e)));
    }
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillment>[];
      json['fulfillments'].forEach((e) => fulfillments!.add(Fulfillment.fromJson(e)));
    }
    if (json['returns'] != null) {
      returns = <Return>[];
      json['returns'].forEach((e) => returns!.add(Return.fromJson(e)));
    }
    if (json['claims'] != null) {
      claims = <ClaimOrder>[];
      json['claims'].forEach((e) => claims!.add(ClaimOrder.fromJson(e)));
    }
    if (json['refunds'] != null) {
      refunds = <Refund>[];
      json['refunds'].forEach((e) => refunds!.add(Refund.fromJson(e)));
    }
    if (json['swaps'] != null) {
      swaps = <Swap>[];
      json['swaps'].forEach((e) => swaps!.add(Swap.fromJson(e)));
    }

    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    if (json['returnable_items'] != null) {
      returnableItems = <LineItem>[];
      json['returnable_items'].forEach((e) => returnableItems!.add(LineItem.fromJson(e)));
    }
    if (json['gift_card_transactions'] != null) {
      giftCardTransactions = <GiftCardTransaction>[];
      json['gift_card_transactions'].forEach((e) => giftCardTransactions!.add(GiftCardTransaction.fromJson(e)));
    }

    return Order(
      id: json['id'],
      status:
          OrderStatus.values.firstWhere((e) => e.value == (json['status'] ?? ''), orElse: () => OrderStatus.pending),
      fulfillmentStatus: FulfillmentStatus.values.firstWhere((e) => e.value == (json['fulfillment_status'] ?? ''),
          orElse: () => FulfillmentStatus.notFulfilled),
      paymentStatus: PaymentStatus.values
          .firstWhere((e) => e.value == (json['payment_status'] ?? ''), orElse: () => PaymentStatus.notPaid),
      displayId: json['display_id'],
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      customerId: json['customer_id'],
      customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      email: json['email'],
      billingAddressId: json['billing_address_id'],
      billingAddress: json['billing_address'] != null ? Address.fromJson(json['billing_address']) : null,
      shippingAddressId: json['shipping_address_id'],
      shippingAddress: json['shipping_address'] != null ? Address.fromJson(json['shipping_address']) : null,
      regionId: json['region_id'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
      currencyCode: json['currency_code'],
      currency: json['currency'] != null ? Currency.fromJson(json['currency']) : null,
      taxRate: json['tax_rate'],
      draftOrderId: json['draft_order_id'],
      draftOrder: json['draft_order'] != null ? DraftOrder.fromJson(json['draft_order']) : null,
      canceledAt: DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal(),
      noNotification: json['no_notification'],
      idempotencyKey: json['idempotency_key'],
      externalId: json['external_id'],
      salesChannelId: json['sales_channel_id'],
      salesChannel: json['sales_channel'] != null ? SalesChannel.fromJson(json['sales_channel']) : null,
      shippingTotal: json['shipping_total'],
      discountTotal: json['discount_total'],
      taxTotal: json['tax_total'],
      refundedTotal: json['refunded_total'],
      total: json['total'],
      subTotal: json['subtotal'],
      paidTotal: json['paid_total'],
      refundableAmount: json['refundable_amount'],
      giftCardTotal: json['gift_card_total'],
      giftCardTaxTotal: json['gift_card_tax_total'],
      returnableItems: returnableItems,
      items: items,
      giftCardTransactions: giftCardTransactions,
      giftCards: giftCards,
      swaps: swaps,
      refunds: refunds,
      returns: returns,
      claims: claims,
      fulfillments: fulfillments,
      discounts: discounts,
      payments: payments,
      shippingMethods: shippingMethods,
      rawDiscountTotal: json['raw_discount_total'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status.value;
    json['fulfillment_status'] = fulfillmentStatus.value;
    json['payment_status'] = paymentStatus.value;
    json['display_id'] = displayId;
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson();
    json['customer_id'] = customerId;
    json['customer'] = customer?.toJson();
    json['email'] = email;
    json['billing_address_id'] = billingAddressId;
    json['billing_address'] = billingAddress?.toJson();
    json['shipping_address_id'] = shippingAddressId;
    json['shipping_address'] = shippingAddress?.toJson();
    json['region_id'] = regionId;
    json['region'] = region;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson();
    json['tax_rate'] = taxRate;
    json['discounts'] = discounts?.map((e) => e.toJson()).toList();
    json['gift_cards'] = giftCards?.map((e) => e.toJson()).toList();
    json['shipping_methods'] = shippingMethods?.map((e) => e.toJson()).toList();
    json['fulfillments'] = fulfillments?.map((e) => e.toJson()).toList();
    json['returns'] = returns?.map((e) => e.toJson()).toList();
    json['claims'] = claims?.map((e) => e.toJson()).toList();
    json['refunds'] = refunds?.map((e) => e.toJson()).toList();
    json['swaps'] = swaps?.map((e) => e.toJson()).toList();
    json['draft_order_id'] = draftOrderId;
    json['draft_order'] = draftOrder?.toJson();
    json['items'] = items?.map((e) => e.toJson()).toList();
    json['gift_card_transactions'] = giftCardTransactions?.map((e) => e.toJson()).toList();
    json['canceled_at'] = canceledAt.toString();
    json['no_notification'] = noNotification;
    json['idempotency_key'] = idempotencyKey;
    json['external_id'] = externalId;
    json['sales_channel_id'] == salesChannelId;
    json['sales_channel'] = salesChannel?.toJson();
    json['shipping_total'] = shippingTotal;
    json['discount_total'] = discountTotal;
    json['tax_total'] = taxTotal;
    json['refunded_total'] = refundedTotal;
    json['total'] = total;
    json['subtotal'] = subTotal;
    json['paid_total'] = paidTotal;
    json['refundable_amount'] = refundableAmount;
    json['gift_card_total'] = giftCardTotal;
    json['gift_card_tax_total'] = giftCardTaxTotal;
    return json;
  }
}

enum OrderStatus {
  pending('pending'),
  completed('completed'),
  archived('archived'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  const OrderStatus(this.value);
}

enum FulfillmentStatus {
  notFulfilled('not_fulfilled'),
  partiallyFulfilled('partially_fulfilled'),
  fulfilled('fulfilled'),
  partiallyShipped('partially_shipped'),
  shipped('shipped'),
  partiallyReturned('partially_returned'),
  returned('returned'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  const FulfillmentStatus(this.value);
}

enum PaymentStatus {
  notPaid('not_paid'),
  awaiting('awaiting'),
  captured('captured'),
  partiallyRefunded('partially_refunded'),
  refunded('refunded'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  const PaymentStatus(this.value);
}
