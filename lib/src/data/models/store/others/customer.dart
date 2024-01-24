import 'address.dart';
import 'customer_group.dart';
import '../orders/order.dart';

class Customer {
  /// The customer's id
  ///
  /// Example: "cus_01G2SG30J8C85S4A5CHM2S1NS2"
  final String? id;

  /// The customer's email
  final String email;

  /// The customer's first name
  ///
  /// Example: "Arno"
  final String? firstName;

  /// The customer's last name
  ///
  /// Example: "Willms"
  final String? lastName;

  /// The customer's billing address id
  ///
  /// Example: "addr_01G8ZH853YPY9B94857DY91YGW"
  final String? billingAddressId;

  /// The details of the billing address associated with the customer.
  final Address? billingAddress;

  /// The details of the shipping addresses associated with the customer.
  final List<Address>? shippingAddresses;

  /// The customer's phone number
  ///
  /// Example: 16128234334802
  final String? phone;

  /// Whether the customer has an account or not
  final bool hasAccount;

  /// The details of the orders this customer placed.
  final List<Order>? orders;

  /// The customer groups the customer belongs to.
  final List<CustomerGroup>? customerGroup;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Customer({
    required this.email,
    this.id,
    this.firstName,
    this.lastName,
    this.billingAddressId,
    this.billingAddress,
    this.shippingAddresses,
    this.phone,
    this.hasAccount = false,
    this.orders,
    this.customerGroup,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });
  factory Customer.fromJson(Map<String, dynamic> json) {
    Address? billingAddress;
    List<Address>? shippingAddresses;
    List<Order>? orders;
    List<CustomerGroup>? customerGroup;

    billingAddress = json['billing_address'] != null ? Address.fromJson(json['billing_address']) : null;

    if (json['shipping_addresses'] != null) {
      shippingAddresses = <Address>[];
      json['shipping_addresses'].forEach(
        (element) => shippingAddresses?.add(
          Address.fromJson(element),
        ),
      );
    }

    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((element) => orders!.add(Order.fromJson(element)));
    }
    if (json['groups'] != null) {
      customerGroup = <CustomerGroup>[];
      json['groups'].forEach((element) => customerGroup!.add(CustomerGroup.fromJson(element)));
    }
    return Customer(
      id: json['id'],
      email: json['email'],
      hasAccount: json['has_account'] ?? false,
      phone: json['phone'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      billingAddressId: json['billing_address_id'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      billingAddress: billingAddress,
      shippingAddresses: shippingAddresses,
      orders: orders,
      customerGroup: customerGroup,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['billing_address_id'] = billingAddressId;
    json['billing_address'] = billingAddress?.toJson();
    json['shipping_addresses'] = shippingAddresses != null ? shippingAddresses?.map((e) => e.toJson()).toList() : [];
    json['phone'] = phone;
    json['has_account'] = hasAccount;
    json['orders'] = orders != null ? orders?.map((e) => e.toJson()).toList() : [];
    json['groups'] = customerGroup != null ? customerGroup?.map((e) => e.toJson()).toList() : [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
