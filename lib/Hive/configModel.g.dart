// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigModelAdapter extends TypeAdapter<ConfigModel> {
  @override
  final int typeId = 1;

  @override
  ConfigModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigModel(
      modemPhonNumber: fields[0] as String,
      lockStatus: fields[1] as String?,
      timerStatus: fields[2] as String?,
      balance: fields[3] as String?,
      callSMSPhone: (fields[6] as List?)?.cast<String>(),
      carStatus: fields[4] as String?,
      delayTime: fields[10] as String?,
      operatorName: fields[11] as String?,
      user1Phone: fields[7] as String?,
      user2Phone: fields[8] as String?,
      user3Phone: fields[9] as String?,
      users: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ConfigModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.modemPhonNumber)
      ..writeByte(1)
      ..write(obj.lockStatus)
      ..writeByte(2)
      ..write(obj.timerStatus)
      ..writeByte(3)
      ..write(obj.balance)
      ..writeByte(4)
      ..write(obj.carStatus)
      ..writeByte(5)
      ..write(obj.users)
      ..writeByte(6)
      ..write(obj.callSMSPhone)
      ..writeByte(7)
      ..write(obj.user1Phone)
      ..writeByte(8)
      ..write(obj.user2Phone)
      ..writeByte(9)
      ..write(obj.user3Phone)
      ..writeByte(10)
      ..write(obj.delayTime)
      ..writeByte(11)
      ..write(obj.operatorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
