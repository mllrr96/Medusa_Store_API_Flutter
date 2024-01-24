class StoreAuthRequest {
  /// The customer's email.
  final String? email;

  /// The customer's password.
  final String? password;

  StoreAuthRequest({
    this.email,
    this.password,
  });

  factory StoreAuthRequest.fromJson(Map<String, dynamic> json) {
    return StoreAuthRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
