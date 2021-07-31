import 'package:hive/hive.dart';
part 'mess_hive_field.g.dart';

@HiveType(typeId: 1)
class MessHiveField {
  MessHiveField({required this.peerId, required this.text});

  @HiveField(0)
  String peerId;
  @HiveField(1)
  String text;

  @override
  String toString() {
    return '$peerId: $text';
  }
}

@HiveType(typeId: 2)
class MessPublicHiveField extends HiveObject {
  MessPublicHiveField({required this.peerId, required this.name, required this.listMess, required this.dateTime});

  @HiveField(0)
  String peerId;
  @HiveField(1)
  String? name;
  @HiveField(2)
  List<MessHiveField>? listMess;
  @HiveField(3)
  String? dateTime;
  @override
  String toString() {
    return '$peerId: $name';
  }
}
