// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stud_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SNotificationModal _$SNotificationFromJson(Map<String, dynamic> json) {
  return SNotificationModal(
    title: json['title'] as String,
    message: json['message'] as String,
    created_on: json['created_on'] as String,
    notice_file: json['notice_file'] as String,
    // PER_PNONE_NO: json['PER_PNONE_NO'] as String,
    // EMAIL_ID: json['EMAIL_ID'] as String,
    // subscription: json['subscription'] as bool,
    // address: json['address'] == null
    //     ? null
    //     : Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SNotificationToJson(SNotificationModal instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'created_on': instance.created_on,
      'notice_file': instance.notice_file

      // 'address': instance.address?.toJson(),
    };
