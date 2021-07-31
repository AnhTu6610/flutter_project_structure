import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  final String? uid;
  String? displayName;
  String? photoURL;
  String? fcmToken;
  String? gender;
  String? age;
  String? description;
  String? objectGender;
  bool? block;

  Profile({this.uid, this.displayName, this.photoURL, this.fcmToken, this.gender, this.age, this.description, this.objectGender, this.block});
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
