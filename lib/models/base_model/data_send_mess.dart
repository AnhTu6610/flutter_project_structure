import 'package:json_annotation/json_annotation.dart';
part 'data_send_mess.g.dart';

@JsonSerializable()
class DataSendMess {
  String? stt;
  String? name;
  String? mess;
  String? peerId;

  DataSendMess({this.stt, this.name, this.mess, this.peerId});
  factory DataSendMess.fromJson(Map<String, dynamic> json) => _$DataSendMessFromJson(json);
  Map<String, dynamic> toJson() => _$DataSendMessToJson(this);
}
