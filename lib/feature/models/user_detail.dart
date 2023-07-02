import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable()
@immutable
final class UserDetail with EquatableMixin {
  const UserDetail({
    this.computer,
    this.computerUrl,
    this.extensions,
    this.theme,
    this.settingValue,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
  final String? computer;
  final String? computerUrl;
  final List<String>? extensions;
  final String? theme;
  final String? settingValue;

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  @override
  List<Object?> get props =>
      [computer, computerUrl, extensions, theme, settingValue];

  UserDetail copyWith({
    String? computer,
    String? computerUrl,
    List<String>? extensions,
    String? theme,
    String? settingValue,
  }) {
    return UserDetail(
      computer: computer ?? this.computer,
      computerUrl: computerUrl ?? this.computerUrl,
      extensions: extensions ?? this.extensions,
      theme: theme ?? this.theme,
      settingValue: settingValue ?? this.settingValue,
    );
  }
}
