import '../index.dart';
import 'index.dart';

class LineItem {
  /// The line item's id
  ///
  /// Example: "item_01G8ZC9GWT6B2GP5FSXRXNFNGN"
  final String? id;

  /// The id of the cart that the line item may belongs to.
  ///
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  final String? cartId;

  /// The details of the cart that the line item may belongs to.
  final Cart? cart;

  /// The id of the order that the line item may belongs to.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  /// The details of the order that the line item may belongs to.
  final Order? order;

  /// The id of the swap that the line item may belong to.
  final String? swapId;

  /// The details of the swap that the line item may belong to.
  final Swap? swap;

  /// The id of the claim that the line item may belong to.
  final String? claimOrderId;

  /// The details of the claim that the line item may belong to.
  final ClaimOrder? claimOrder;

  /// The details of the item's tax lines.
  final List<LineItemTaxLine>? taxLines;

  /// The details of the item's adjustments, which are available when a discount is applied on the item.
  final List<LineItemAdjustment>? adjustments;

  /// The title of the line item.
  ///
  /// Example: "Medusa Coffee Mug"
  final String? title;

  /// A more detailed description of the contents of the line item.
  ///
  /// Example: "One Size"
  final String? description;

  /// A url string to a small image of the contents of the line item.
  ///
  /// Example: "https://medusa-public-images.s3.eu-west-1.amazonaws.com/coffee-mug.png"
  final String? thumbnail;

  /// Is the item being returned
  final bool? isReturn;

  /// Flag to indicate if the line item is a gift card.
  final bool? isGiftCard;

  /// Flag to indicate if new line items with the same variant should be merged or added as an additional line item.
  ///
  /// Default: true
  final bool? shouldMerge;

  /// Flag to indicate if the line item should be included when doing discount calculations.
  final bool? allowDiscounts;

  /// Flag to indicate if the line item has fulfillment associated with it.
  final bool? hasShipping;

  /// The price of one unit of the content in the line item. this should be in the currency defined by the cart/order/swap/claim that the line item belongs to.
  ///
  /// Example: 8000
  final int? unitPrice;

  /// The id of the product variant contained in the line item.
  ///
  /// Example: "variant_01G1G5V2MRX2V3PVSR2WXYPFB6"
  final String? variantId;

  /// The details of the product variant that this item was created from.
  final ProductVariant? variant;

  /// The quantity of the content in the line item.
  final int? quantity;

  /// The quantity of the line item that has been fulfilled.
  final int? fulfilledQuantity;

  /// The quantity of the line item that has been returned.
  final int? returnedQuantity;

  /// The quantity of the line item that has been shipped.
  final int? shippedQuantity;

  /// The amount that can be refunded from the given line item. takes taxes and discounts into consideration.
  final int? refundable;

  /// The subtotal of the line item
  final int? subtotal;

  /// The total of tax of the line item
  final int? taxTotal;

  /// The total amount of the line item
  final int? total;

  /// The original total amount of the line item
  final int? originalTotal;

  /// The original tax total amount of the line item
  final int? originalTaxTotal;

  /// The total of discount of the line item
  final int? rawDiscountTotal;

  /// The total of discount of the line item rounded
  final int? discountTotal;

  /// The total of the gift card of the line item
  final int? giftCardTotal;

  /// Indicates if the line item unit_price include tax
  ///
  /// Feature flag
  final bool? includesTax;

  /// The id of the original line item. this is useful if the line item belongs to a resource that references an order, such as a return or an order edit.
  final String? originalItemId;

  /// The id of the order edit that the item may belong to.
  final String? orderEditId;

  /// The details of the order edit.
  final OrderEdit? orderEdit;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  LineItem({
    this.id,
    this.cartId,
    this.cart,
    this.orderId,
    this.order,
    this.swapId,
    this.swap,
    this.claimOrderId,
    this.rawDiscountTotal,
    this.claimOrder,
    this.taxLines,
    this.adjustments,
    required this.title,
    this.description,
    this.thumbnail,
    this.isReturn,
    this.isGiftCard,
    this.shouldMerge,
    this.allowDiscounts,
    this.hasShipping,
    required this.unitPrice,
    this.variantId,
    this.variant,
    required this.quantity,
    this.fulfilledQuantity,
    this.returnedQuantity,
    this.shippedQuantity,
    this.refundable,
    this.subtotal,
    this.taxTotal,
    this.total,
    this.originalTotal,
    this.originalTaxTotal,
    this.discountTotal,
    this.giftCardTotal,
    this.includesTax,
    this.originalItemId,
    this.orderEditId,
    this.orderEdit,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) {
    List<LineItemTaxLine>? taxLines;
    List<LineItemAdjustment>? adjustments;

    if (json['tax_lines'] != null) {
      taxLines = <LineItemTaxLine>[];
      json['tax_lines'].forEach((e) => taxLines!.add(LineItemTaxLine.fromJson(e)));
    }
    if (json['adjustments'] != null) {
      adjustments = <LineItemAdjustment>[];
      json['adjustments'].forEach((e) => adjustments!.add(LineItemAdjustment.fromJson(e)));
    }

    return LineItem(
      id: json['id'],
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      swapId: json['swap_id'],
      swap: json['swap'] != null ? Swap.fromJson(json['swap']) : null,
      claimOrderId: json['claim_order_id'],
      claimOrder: json['claim_order'] != null ? ClaimOrder.fromJson(json['claim_order']) : null,
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      isReturn: json['is_return'],
      isGiftCard: json['is_giftcard'],
      shouldMerge: json['should_merge'],
      allowDiscounts: json['allow_discounts'],
      hasShipping: json['has_shipping'],
      unitPrice: json['unit_price'],
      variantId: json['variant_id'],
      adjustments: adjustments,
      taxLines: taxLines,
      variant: json['variant'] != null ? ProductVariant.fromJson(json['variant']) : null,
      quantity: json['quantity'],
      fulfilledQuantity: json['fulfilled_quantity'],
      shippedQuantity: json['shipped_quantity'],
      refundable: json['refundable'],
      subtotal: json['subtotal'],
      taxTotal: json['tax_total'],
      total: json['total'],
      originalTotal: json['original_total'],
      originalTaxTotal: json['original_tax_total'],
      discountTotal: json['discount_total'],
      giftCardTotal: json['gift_card_total'],
      includesTax: json['includes_tax'],
      originalItemId: json['original_item_id'],
      orderEditId: json['order_edit_id'],
      orderEdit: json['order_edit'] != null ? OrderEdit.fromJson(json['order_edit']) : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson();
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson();
    json['tax_lines'] = taxLines?.map((e) => e.toJson()).toList();
    json['adjustments'] = adjustments?.map((e) => e.toJson()).toList();
    json['title'] = title;
    json['description'] = description;
    json['thumbnail'] = thumbnail;
    json['is_return'] = isReturn;
    json['is_giftcard'] = isGiftCard;
    json['should_merge'] = shouldMerge;
    json['allow_discounts'] = allowDiscounts;
    json['has_shipping'] = hasShipping;
    json['unit_price'] = unitPrice;
    json['variant_id'] = variantId;
    json['variant'] = variant?.toJson();
    json['quantity'] = quantity;
    json['fulfilled_quantity'] = fulfilledQuantity;
    json['shipped_quantity'] = shippedQuantity;
    json['refundable'] = refundable;
    json['subtotal'] = subtotal;
    json['tax_total'] = taxTotal;
    json['total'] = total;
    json['original_total'] = originalTotal;
    json['original_tax_total'] = originalTaxTotal;
    json['discount_total'] = discountTotal;
    json['gift_card_total'] = giftCardTotal;
    json['includes_tax'] = includesTax;
    json['original_item_id'] = originalItemId;
    json['order_edit_id'] = orderEditId;
    json['order_edit'] = orderEdit?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata.toString();
    return json;
  }
}
