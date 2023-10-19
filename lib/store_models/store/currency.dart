class Currency {
  /// The 3 character ISO code for the currency.
  ///
  /// Example: "usd"
  final String? code;

  /// The symbol used to indicate the currency.
  ///
  /// Example: "$"
  final String? symbol;

  /// The native symbol used to indicate the currency.
  ///
  /// Example: "$"
  final String? symbolNative;

  /// The written name of the currency
  ///
  /// Example: "US Dollar"
  final String? name;

  /// [EXPERIMENTAL] Does the currency prices include tax
  ///
  /// Default: false
  final bool? includeTax;

  Currency({
    this.code,
    this.symbol,
    this.symbolNative,
    this.name,
    this.includeTax,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json['code'],
        symbol: json['symbol'],
        symbolNative: json['symbol_native'],
        name: json['name'],
        includeTax: json['include_tax'],
      );

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['code'] = code;
    json['symbol'] = symbol;
    json['symbolNative'] = symbolNative;
    json['name'] = name;
    json['include_tax'] = includeTax;
    return json;
  }
}
