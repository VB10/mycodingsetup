// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      computer: json['computer'] as String?,
      computerUrl: json['computerUrl'] as String?,
      extensions: (json['extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      theme: json['theme'] as String?,
      settingValue: json['settingValue'] as String?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'computer': instance.computer,
      'computerUrl': instance.computerUrl,
      'extensions': instance.extensions,
      'theme': instance.theme,
      'settingValue': instance.settingValue,
    };
