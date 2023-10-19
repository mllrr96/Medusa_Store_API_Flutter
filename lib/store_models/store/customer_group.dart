import 'index.dart';

class CustomerGroup {
  /// The customer group's id
  ///
  /// Example: "cgrp_01G8ZH853Y6TFXWPG5EYE81X63"
  final String? id;

  /// The name of the customer group
  ///
  /// Example: "VIP"
  final String? name;

  /// The details of the customers that belong to the customer group.
  final List<Customer>? customers;

  /// The price lists that are associated with the customer group.
  final List<PriceList>? priceLists;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  CustomerGroup({
    this.id,
    required this.name,
    this.customers,
    this.priceLists,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory CustomerGroup.fromJson(Map<String, dynamic> json) {
    List<Customer>? customers;
    List<PriceList>? priceLists;
    if (json['customers'] != null) {
      customers = <Customer>[];
      json['customers'].forEach((element) => customers!.add(Customer.fromJson(element)));
    }
    if (json['price_lists'] != null) {
      priceLists = <PriceList>[];
      json['price_lists'].forEach((element) => priceLists!.add(PriceList.fromJson(element)));
    }

    return CustomerGroup(
      name: json['name'],
      id: json['id'],
      priceLists: priceLists,
      customers: customers,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['name'] = name;
    json['id'] = id;
    json['customers'] = customers?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
