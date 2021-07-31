// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    uid: json['uid'] as String?,
    displayName: json['displayName'] as String?,
    photoURL: json['photoURL'] as String?,
    fcmToken: json['fcmToken'] as String?,
    gender: json['gender'] as String?,
    age: json['age'] as String?,
    description: json['description'] as String?,
    objectGender: json['objectGender'] as String?,
    block: json['block'] as bool?,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'fcmToken': instance.fcmToken,
      'gender': instance.gender,
      'age': instance.age,
      'description': instance.description,
      'objectGender': instance.objectGender,
      'block': instance.block,
    };
