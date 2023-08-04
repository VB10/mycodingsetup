// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      githubUrl: fields[0] as String?,
      name: fields[1] as String?,
      photo: fields[2] as String?,
      shortBio: fields[3] as String?,
      userName: fields[4] as String?,
      githubId: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.githubUrl)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.shortBio)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.githubId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      githubUrl: json['githubUrl'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      shortBio: json['shortBio'] as String?,
      userName: json['userName'] as String?,
      githubId: json['githubId'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'githubUrl': instance.githubUrl,
      'name': instance.name,
      'photo': instance.photo,
      'shortBio': instance.shortBio,
      'userName': instance.userName,
      'githubId': instance.githubId,
    };
