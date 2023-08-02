// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      githubUrl: json['GithubUrl'] as String?,
      name: json['Name'] as String?,
      photo: json['Photo'] as String?,
      shortBio: json['ShortBio'] as String?,
      userName: json['UserName'] as String?,
      githubId: json['GithubId'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'GithubUrl': instance.githubUrl,
      'Name': instance.name,
      'Photo': instance.photo,
      'ShortBio': instance.shortBio,
      'UserName': instance.userName,
      'GithubId': instance.githubId,
    };
