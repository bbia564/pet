import 'package:pet_manager/app/customs/app_util.dart';

class PetModel {
  int? id;
  String? name;
  int? birth;
  String? photo;
  int? createTime;
  String? birthStr;

  PetModel({this.id, this.name, this.birth, this.photo, this.createTime});

  PetModel.fromJson(Map<String, dynamic> json) {
    id = json['pet_id'];
    name = json['name'];
    birth = json['birth'];
    photo = json['photo'];
    createTime = json["createTime"];
    setStr();
  }

  void setStr() {
    final date = DateTime.fromMillisecondsSinceEpoch(birth ?? 0);
    birthStr = PMAppUtil.formatDateWithoutHour(dateTime: date);
  }
}

class PMEventModel {
  int? id;
  int? petId;
  String? event;
  int? eventTime;
  int? createTime;
  String? name;
  int? birth;
  String? photo;
  String? createTimeStr;

  PMEventModel({
    this.id,
    this.petId,
    this.eventTime,
    this.createTime,
    this.createTimeStr,
    this.name,
    this.birth,
    this.photo,
  });

  PMEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['pet_id'];
    event = json['event'];
    eventTime = json['eventTime'];
    createTime = json["createTime"];

    name = json['name'];
    birth = json['birth'];
    photo = json["photo"];

    final date = DateTime.fromMillisecondsSinceEpoch(createTime ?? 0);
    createTimeStr = PMAppUtil.formatDateWithoutHour(dateTime: date);
  }
}
