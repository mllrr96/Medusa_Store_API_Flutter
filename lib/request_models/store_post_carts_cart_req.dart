class StorePostCartsCartReq {
  /// The id of the region to create the cart in.
  /// setting the cart's region can affect the pricing of the items in the cart as well as the used currency.
  final String? regionId;

  /// The 2 character iso country code to create the cart in.
  /// setting this parameter will set the country code of the shipping address.
  final String? countryCode;

  /// An email to be used on the cart.
  final String? email;

  /// A full billing address object.
  final String? billingAddress;

  /// A full shipping address object.
  final String? shippingAddress;

  /// An array of gift card codes to add to the cart.
  final List<String>? giftCards;

  /// An array of discount codes to add to the cart.
  final List<String>? discounts;

  /// The id of the customer to associate the cart with.
  final String? customerId;

  /// The id of the sales channel to create the cart in. the cart's sales channel affects which products can be added to the cart.
  /// if a product does not exist in the cart's sales channel, it cannot be added to the cart.
  /// if you add a publishable api key in the header of this request and specify a sales channel id,
  /// the specified sales channel must be within the scope of the publishable api key's resources.
  final String? salesChannelId;

  StorePostCartsCartReq({
    this.regionId,
    this.countryCode,
    this.email,
    this.billingAddress,
    this.shippingAddress,
    this.giftCards,
    this.discounts,
    this.customerId,
    this.salesChannelId,
  });

  factory StorePostCartsCartReq.fromJson(Map<String, dynamic> json) {
    return StorePostCartsCartReq(
      regionId: json['region_id'],
      countryCode: json['country_code'],
      email: json['email'],
      billingAddress: json['billing_address'],
      shippingAddress: json['shipping_address'],
      customerId: json['customer_id'],
      salesChannelId: json['sales_channel_id'],
      discounts: json['discounts'],
      giftCards: json['gift_cards'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (regionId != null) {
      data['region_id'] = regionId;
    }
    if (countryCode != null) {
      data['country_code'] = countryCode;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (billingAddress != null) {
      data['billing_address'] = billingAddress;
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress;
    }
    if (customerId != null) {
      data['customer_id'] = customerId;
    }
    if (salesChannelId != null) {
      data['sales_channel_id'] = salesChannelId;
    }

    if (giftCards != null) {
      data['gift_cards'] = giftCards;
    }
    if (discounts != null) {
      data['discounts'] = discounts;
    }
    return data;
  }
}
