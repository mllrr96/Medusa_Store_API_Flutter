

import 'user.dart';

class Invite {
  String? id;
  String? userEmail;
  UserRoles role = UserRoles.member;
  bool? accepted;
  String? token;
  DateTime? expiresAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  Invite({
    this.id,
    required this.userEmail,
    this.role = UserRoles.member,
    this.accepted,
    this.token,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  Invite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userEmail = json['user_email'];
    role = UserRoles.values.firstWhere((e) => e.value == (json['role'] ?? ''));
    accepted = json['accepted'];
    token = json['token'];
    expiresAt = json['expires_at'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['user_email'] = userEmail;
    json['role'] = role.value;
    json['accepted'] = accepted;
    json['token'] = token;
    json['expires_at'] = expiresAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
