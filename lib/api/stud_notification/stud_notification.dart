// import 'package:json_annotation/json_annotation.dart';
// import 'address.dart';

part 's_notification.g.dart';

@JsonSerializable(explicitToJson: true)
class SNotificationModal {
  String title, description, date, time;
  // bool subscription;
  // Address address;

  SNotificationModal({
    required this.title,
    required this.description,
    required this.date,
    required this.time,

    // required this.address
  });

  factory SNotificationModal.fromJson(Map<String, dynamic> data) =>
      _$SNotificationFromJson(data);

  Map<String, dynamic> toJson() => _$SNotificationToJson(this);
}

class JsonSerializable {
  const JsonSerializable({required bool explicitToJson});
}
