import 'country.dart';
import 'customer.dart';

class Address {
  /// Id of the address
  ///
  /// Example: "addr_01G8ZC9VS1XVE149MGH2J7QSSH"
  final String? id;

  /// Id of the customer this address belongs to
  ///
  /// Example: "cus_01G2SG30J8C85S4A5CHM2S1NS2"
  final String? customerId;

  /// The details of the customer.
  final List<Customer>? customer;

  /// Company name
  ///
  /// Example: "Acme"
  final String? company;

  /// First name
  ///
  /// Example: "Arno"
  final String? firstName;

  /// Last name
  ///
  /// Example: "Willms"
  final String? lastName;

  /// Address line 1
  ///
  /// Example: "14433 Kemmer Court"
  final String? address1;

  /// Address line 2
  ///
  /// Example: "Suite 369"
  final String? address2;

  /// City
  ///
  /// Example: "South Geoffreyview"
  final String? city;

  final Country? country;

  /// The 2 character iso code of the country in lower case
  ///
  /// Example: "st"
  final String? countryCode;

  /// Province
  ///
  /// Example: "Kentucky"
  final String? province;

  /// Postal code
  ///
  /// Example: 72093
  final String? postalCode;

  /// Phone number
  ///
  /// Example: 16128234334802
  final String? phone;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Address({
    this.id,
    this.customerId,
    this.customer,
    this.company,
    this.firstName,
    this.lastName,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.countryCode,
    this.province,
    this.postalCode,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    List<Customer>? customer;

    if (json['customer'] != null) {
      customer = <Customer>[];
      json['customer'].forEach(
        (element) => customer!.add(
          Customer.fromJson(element),
        ),
      );
    }

    return Address(
      id: json['id'],
      customerId: json['customer_id'],
      company: json['company'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      customer: customer,
      address1: json['address_1'],
      address2: json['address_2'],
      city: json['city'],
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      countryCode: json['country_code'],
      province: json['province'],
      postalCode: json['postal_code'],
      phone: json['phone'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (id != null) {
      json['id'] = id;
    }

    if (customerId != null) {
      json['customer_id'] = customerId;
    }

    if (customer != null) {
      json['customer'] = customer?.map((e) => e.toJson()).toList();
    }

    if (company != null) {
      json['company'] = company;
    }

    if (firstName != null) {
      json['first_name'] = firstName;
    }

    if (lastName != null) {
      json['last_name'] = lastName;
    }

    if (address1 != null) {
      json['address_1'] = address1;
    }

    if (address2 != null) {
      json['address_2'] = address2;
    }

    if (city != null) {
      json['city'] = city;
    }

    if (countryCode != null) {
      json['country_code'] = countryCode;
    }

    if (country != null) {
      json['country'] = country?.toJson();
    }

    if (province != null) {
      json['province'] = province;
    }

    if (postalCode != null) {
      json['postal_code'] = postalCode;
    }

    if (phone != null) {
      json['phone'] = phone;
    }

    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }

    if (deletedAt != null) {
      json['deleted_at'] = deletedAt.toString();
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}
