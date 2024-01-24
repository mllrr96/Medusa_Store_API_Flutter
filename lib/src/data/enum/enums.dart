enum BatchJobType {
  productImport('product-import'),
  productExport('product-export');

  const BatchJobType(this.value);

  final String value;
}

enum BatchJobStatus {
  created('created'),
  preProcessed('pre_processed'),
  confirmed('confirmed'),
  processing('processing'),
  completed('completed'),
  canceled('canceled'),
  failed('failed');

  const BatchJobStatus(this.value);

  final String value;
}

enum DiscountConditionType {
  products('products'),
  productType('product_type'),
  productCollections('product_collections'),
  productTags('product_tags'),
  customerGroups('customer_groups');

  final String value;

  const DiscountConditionType(this.value);
}

enum DiscountConditionOperator {
  inn('in'),
  notIn('not_in');

  final String value;

  const DiscountConditionOperator(this.value);
}

enum OrderEditStatus {
  confirmed,
  declined,
  requested,
  created,
  canceled,
}

enum ShippingProfileType {
  defaultType('default'),
  custom('custom'),
  giftCard('gift_card');

  final String value;

  const ShippingProfileType(this.value);
}

enum RefundReason {
  discount('discount'),
  returns('return'),
  swap('swap'),
  claim('claim'),
  other('other');

  final String value;

  const RefundReason(this.value);
}

enum DraftOrderStatus {
  open('open'),
  completed('completed');

  final String value;

  const DraftOrderStatus(this.value);
}

enum UserRoles {
  admin('admin'),
  member('member'),
  developer('developer');

  final String value;

  const UserRoles(this.value);

  factory UserRoles.fromString(String value) {
    if (value == 'admin') {
      return UserRoles.admin;
    } else if (value == 'developer') {
      return UserRoles.developer;
    } else {
      return UserRoles.member;
    }
  }
}

enum ProductStatus {
  draft('draft'),
  proposed('proposed'),
  published('published'),
  rejected('rejected');

  final String value;

  const ProductStatus(this.value);
}

enum PaymentSessionStatus {
  authorized('authorized'),
  pending('pending'),
  requiresMore('requires_more'),
  error('error'),
  canceled('canceled');

  final String value;

  const PaymentSessionStatus(this.value);
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

enum SwapFulfillmentStatus {
  notFulfilled('not_fulfilled'),
  fulfilled('fulfilled'),
  partiallyShipped('partially_shipped'),
  shipped('shipped'),
  canceled('canceled'),
  requiresAction('requires_action');

  final String value;

  const SwapFulfillmentStatus(this.value);
}

enum SwapPaymentStatus {
  notPaid('not_paid'),
  awaiting('awaiting'),
  captured('captured'),
  confirmed('confirmed'),
  canceled('canceled'),
  differenceRefunded('difference_refunded'),
  partiallyRefunded('partially_refunded'),
  refunded('refunded'),
  requiresAction('requires_action');

  final String value;

  const SwapPaymentStatus(this.value);
}

enum RequirementType {
  minSubtotal('min_subtotal'),
  maxSubtotal('max_subtotal');

  final String value;

  const RequirementType(this.value);
}

enum ShippingOptionPriceType {
  flatRate('flat_rate'),
  calculated('calculated');

  final String value;

  const ShippingOptionPriceType(this.value);
}

enum ReturnStatus {
  requested('requested'),
  received('received'),
  requiresAction('requires_action'),
  canceled('canceled');

  final String value;

  const ReturnStatus(this.value);
}

enum PriceListType {
  sale,
  override,
}

enum PriceListStatus {
  active,
  draft,
}

enum OrderEditItemChangeType {
  itemAdd('item_add'),
  itemRemove('item_remove'),
  itemUpdate('item_update');

  final String value;

  const OrderEditItemChangeType(this.value);
}

enum CartType {
  defaultType('default'),
  swap('swap'),
  draftOrder('draft_order'),
  paymentLink('payment_link'),
  claim('claim');

  final String value;

  const CartType(this.value);
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

enum ClaimReason {
  missingItem('missing_item'),
  wrongItem('wrong_item'),
  productFailure('product_failure'),
  other('other');

  final String value;

  const ClaimReason(this.value);
}

enum ClaimType {
  refund('refund'),
  replace('replace');

  final String value;

  const ClaimType(this.value);
}

enum ClaimPaymentStatus {
  na('na'),
  notRefunded('not_refunded'),
  refunded('refunded');

  final String value;

  const ClaimPaymentStatus(this.value);
}

enum ClaimFulfillmentStatus {
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

  const ClaimFulfillmentStatus(this.value);
}

enum DiscountRuleType {
  fixed('fixed'),
  percentage('percentage'),
  freeShipping('free_shipping');

  final String value;

  const DiscountRuleType(this.value);
}

enum AllocationType {
  total('total'),
  item('item');

  final String value;

  const AllocationType(this.value);
}
