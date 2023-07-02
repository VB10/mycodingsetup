import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
final class User with EquatableMixin {
  const User({
    this.githubUrl,
    this.name,
    this.photo,
    this.shortBio,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? githubUrl;
  final String? name;
  final String? photo;
  final String? shortBio;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [githubUrl, name, photo, shortBio];

  User copyWith({
    String? githubUrl,
    String? name,
    String? photo,
    String? shortBio,
  }) {
    return User(
      githubUrl: githubUrl ?? this.githubUrl,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      shortBio: shortBio ?? this.shortBio,
    );
  }
}

extension UserExtension on User {
  bool get isEmpty =>
      githubUrl == null || name == null || photo == null || shortBio == null;
}
