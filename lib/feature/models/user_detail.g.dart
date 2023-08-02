// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      computer: json['Computer'] as String?,
      computerUrl: json['ComputerUrl'] as String?,
      extensions: (json['Extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      theme: json['Theme'] as String?,
      settingValue: json['SettingValue'] as String?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'Computer': instance.computer,
      'ComputerUrl': instance.computerUrl,
      'Extensions': instance.extensions,
      'Theme': instance.theme,
      'SettingValue': instance.settingValue,
    };
