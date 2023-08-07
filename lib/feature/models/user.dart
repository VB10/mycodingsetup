import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mycodingsetup/product/database/core/hive_types.dart';

import 'package:mycodingsetup/product/database/core/model/hive_model.dart';

part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypes.userModelId)
@immutable
final class User with EquatableMixin, HiveModelMixin {
  const User({
    this.githubUrl,
    this.name,
    this.photo,
    this.shortBio,
    this.userName,
    this.githubId,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  static const String userKey = 'user';

  @override
  // Model unique key
  String get key => userKey;

  @HiveField(0)
  final String? githubUrl;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? photo;
  @HiveField(3)
  final String? shortBio;
  @HiveField(4)
  final String? userName;
  @HiveField(5)
  final int? githubId;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props =>
      [githubUrl, name, photo, shortBio, userName, githubId];

  User copyWith({
    String? githubUrl,
    String? name,
    String? photo,
    String? shortBio,
    String? userName,
    int? githubId,
  }) {
    return User(
      githubUrl: githubUrl ?? this.githubUrl,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      shortBio: shortBio ?? this.shortBio,
      userName: userName ?? this.userName,
      githubId: githubId ?? this.githubId,
    );
  }
}

extension UserExtension on User {
  bool get isEmpty =>
      githubUrl == null || name == null || photo == null || shortBio == null;
}
