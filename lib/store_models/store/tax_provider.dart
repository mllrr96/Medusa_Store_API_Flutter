class TaxProvider {
  /// The id of the tax provider as given by the tax service.
  ///
  /// Example: "manual"
  final String? id;

  /// Whether the tax service is installed in the current version. if a tax service is no longer installed, the is_installed attribute is set to false.
  ///
  /// Default: true
  final bool isInstalled;

  TaxProvider({
    this.id,
    this.isInstalled = true,
  });

  factory TaxProvider.fromJson(Map<String, dynamic> json) {
    return TaxProvider(
      id: json['id'],
      isInstalled: json['is_installed'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['is_installed'] = isInstalled;
    return json;
  }
}
