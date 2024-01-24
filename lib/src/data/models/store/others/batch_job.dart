import '../../../enum/enums.dart';
import 'package:medusa_store_flutter/src/data/models/store/others/user.dart';

class BatchJob {
  String? id;
  BatchJobType? type;
  BatchJobStatus status = BatchJobStatus.created;
  String? createdBy;
  User? createdByUser;

  // context
  bool dryRun = false;

  // result
  DateTime? preProcessedAt;
  DateTime? processingAt;
  DateTime? confirmedAt;
  DateTime? completedAt;
  DateTime? canceledAt;
  DateTime? failedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  BatchJob({
    this.id,
    this.type,
    this.status = BatchJobStatus.created,
    this.createdBy,
    this.createdByUser,
    this.dryRun = false,
    this.preProcessedAt,
    this.processingAt,
    this.confirmedAt,
    this.completedAt,
    this.canceledAt,
    this.failedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  BatchJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'] != null
        ? BatchJobType.values.firstWhere((e) => e.value == (json['type'] ?? ''))
        : null;
    status = BatchJobStatus.values.firstWhere(
        (e) => e.value == (json['status'] ?? ''),
        orElse: () => BatchJobStatus.created);
    createdBy = json['created_by'];
    createdByUser = json['created_by_user'] != null
        ? User.fromJson(json['created_by_user'])
        : null;
    dryRun = json['dry_run'] ?? false;
    preProcessedAt = DateTime.tryParse(json['pre_processed_at'] ?? '')?.toLocal();
    processingAt = DateTime.tryParse(json['processing_at'] ?? '')?.toLocal();
    confirmedAt = DateTime.tryParse(json['confirmed_at'] ?? '')?.toLocal();
    completedAt = DateTime.tryParse(json['completed_at'] ?? '')?.toLocal();
    canceledAt = DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal();
    failedAt = DateTime.tryParse(json['failed_at'] ?? '')?.toLocal();
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['status'] = status.value;
    json['created_by'] = createdBy;
    json['created_by_user'] = createdByUser?.toJson();
    json['dry_run'] = dryRun;
    json['pre_processed_at'] = preProcessedAt.toString();
    json['processing_at'] = processingAt.toString();
    json['confirmed_at'] = confirmedAt.toString();
    json['completed_at'] = completedAt.toString();
    json['canceled_at'] = canceledAt.toString();
    json['failed_at'] = failedAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    return json;
  }
}


