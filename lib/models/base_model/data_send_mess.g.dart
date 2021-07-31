// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_send_mess.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSendMess _$DataSendMessFromJson(Map<String, dynamic> json) {
  return DataSendMess(
    stt: json['stt'] as String?,
    name: json['name'] as String?,
    mess: json['mess'] as String?,
    peerId: json['peerId'] as String?,
  );
}

Map<String, dynamic> _$DataSendMessToJson(DataSendMess instance) =>
    <String, dynamic>{
      'stt': instance.stt,
      'name': instance.name,
      'mess': instance.mess,
      'peerId': instance.peerId,
    };
