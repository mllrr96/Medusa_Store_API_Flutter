import 'index.dart';

class Store {
  String? id;
  String? name;
  String? defaultCurrencyCode;
  Currency? defaultCurrency;
  List<Currency>? currencies;
  String? swapLinkTemplate;
  String? paymentLinkTemplate;
  String? inviteLinkTemplate;
  Map<String, dynamic>? metadata;
  String? defaultSalesChannelId;
  SalesChannel? defaultSalesChannel;

  Store({
    this.id,
    this.name,
    this.defaultCurrencyCode,
    this.defaultCurrency,
    this.currencies,
    this.swapLinkTemplate,
    this.paymentLinkTemplate,
    this.inviteLinkTemplate,
    this.metadata,
    this.defaultSalesChannelId,
    this.defaultSalesChannel,
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    defaultCurrencyCode = json['default_currency_code'];
    defaultCurrency = json['default_currency'] != null
        ? Currency.fromJson(json['default_currency'])
        : null;
    if (json['currencies'] != null) {
      currencies = <Currency>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currency.fromJson(v));
      });
    }
    swapLinkTemplate = json['swap_link_template'];
    paymentLinkTemplate = json['payment_link_template'];
    inviteLinkTemplate = json['invite_link_template'];
    metadata = json['metadata'];
    defaultSalesChannelId = json['default_sales_channel_id'];
    defaultSalesChannel = json['default_sales_channel'] != null
        ? SalesChannel.fromJson(json['default_sales_channel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['default_currency_code'] = defaultCurrencyCode;
    data['default_currency'] = defaultCurrency?.toJson() ;
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    data['swap_link_template'] = swapLinkTemplate;
    data['payment_link_template'] = paymentLinkTemplate;
    data['invite_link_template'] = inviteLinkTemplate;
    data['metadata'] = metadata;
    data['default_sales_channel_id'] = defaultSalesChannelId;
    data['default_sales_channel'] = defaultSalesChannel?.toJson() ;
    return data;
  }
}
