class User {
  /// The user's ID
  String? id;

  /// The email of the User
  String? email;

  /// The first name of the User
  String? firstName;

  /// The last name of the User
  String? lastName;

  /// An API token associated with the user.
  String? apiToken;

  /// The date with timezone at which the resource was created.
  DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  DateTime? deletedAt;

  /// The user's role
  ///
  /// Default: "member"
  ///
  /// Enum: "admin" "member" "developer"
  UserRoles? role;

  /// An optional key-value map with additional details
  ///
  /// Example: {"car":"white"}
  Map<String, dynamic>? metadata;

  User({
    this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.apiToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    apiToken = json['api_token'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    role = UserRoles.fromString(json['role']);
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['api_token'] = apiToken;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
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
