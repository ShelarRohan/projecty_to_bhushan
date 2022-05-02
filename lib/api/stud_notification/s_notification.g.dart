// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stud_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SNotificationModal _$SNotificationFromJson(Map<String, dynamic> json) {
  return SNotificationModal(
    title: json['title'] as String,
    description: json['description'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
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
      'description': instance.description,
      'date': instance.date,
      'time': instance.time,

      // 'address': instance.address?.toJson(),
    };
