// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubProfile _$GithubProfileFromJson(Map<String, dynamic> json) =>
    GithubProfile(
      login: json['login'] as String?,
      id: json['id'] as int?,
      nodeId: json['nodeId'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gravatarId: json['gravatarId'] as String?,
      url: json['url'] as String?,
      htmlUrl: json['htmlUrl'] as String?,
      followersUrl: json['followersUrl'] as String?,
      followingUrl: json['followingUrl'] as String?,
      gistsUrl: json['gistsUrl'] as String?,
      starredUrl: json['starredUrl'] as String?,
      subscriptionsUrl: json['subscriptionsUrl'] as String?,
      organizationsUrl: json['organizationsUrl'] as String?,
      reposUrl: json['reposUrl'] as String?,
      eventsUrl: json['eventsUrl'] as String?,
      receivedEventsUrl: json['receivedEventsUrl'] as String?,
      type: json['type'] as String?,
      siteAdmin: json['siteAdmin'] as bool?,
      name: json['name'] as String?,
      company: json['company'] as String?,
      blog: json['blog'] as String?,
      location: json['location'] as String?,
      email: json['email'] as String?,
      hireable: json['hireable'] as bool?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$GithubProfileToJson(GithubProfile instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatarId': instance.gravatarId,
      'url': instance.url,
      'htmlUrl': instance.htmlUrl,
      'followersUrl': instance.followersUrl,
      'followingUrl': instance.followingUrl,
      'gistsUrl': instance.gistsUrl,
      'starredUrl': instance.starredUrl,
      'subscriptionsUrl': instance.subscriptionsUrl,
      'organizationsUrl': instance.organizationsUrl,
      'reposUrl': instance.reposUrl,
      'eventsUrl': instance.eventsUrl,
      'receivedEventsUrl': instance.receivedEventsUrl,
      'type': instance.type,
      'siteAdmin': instance.siteAdmin,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'bio': instance.bio,
    };
