import 'package:hive/hive.dart';

part 'configModel.g.dart';

@HiveType(typeId: 1)
class ConfigModel extends HiveObject {
  @HiveField(0)
  String? modemPhonNumber;

  @HiveField(1)
  String? lockStatus;

  @HiveField(2)
  String? timerStatus;

  @HiveField(3)
  String? balance;

  @HiveField(4)
  String? carStatus;

  @HiveField(5)
  List<String>? users;

  @HiveField(6)
  List<String>? callSMSPhone;

  @HiveField(7)
  String? user1Phone;

  @HiveField(8)
  String? user2Phone;

  @HiveField(9)
  String? user3Phone;

  @HiveField(10)
  String? delayTime;

  @HiveField(11)
  String? operatorName;

  ConfigModel(
      {this.modemPhonNumber,
      this.lockStatus,
      this.timerStatus,
      this.balance,
      this.callSMSPhone,
      this.carStatus,
      this.delayTime,
      this.operatorName,
      this.user1Phone,
      this.user2Phone,
      this.user3Phone,
      this.users});
}
