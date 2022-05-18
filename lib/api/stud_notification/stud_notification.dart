// import 'package:json_annotation/json_annotation.dart';
// import 'address.dart';

part 's_notification.g.dart';

@JsonSerializable(explicitToJson: true)
class SNotificationModal {
  String title, message, created_on, notice_file;
  // bool subscription;
  // Address address;

  SNotificationModal({
    required this.title,
    required this.message,
    required this.created_on,
    required this.notice_file,

    // required this.address
  });

  factory SNotificationModal.fromJson(Map<String, dynamic> data) =>
      _$SNotificationFromJson(data);

  Map<String, dynamic> toJson() => _$SNotificationToJson(this);
}

class JsonSerializable {
  const JsonSerializable({required bool explicitToJson});
}
