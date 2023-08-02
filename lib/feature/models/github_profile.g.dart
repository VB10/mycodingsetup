// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubProfile _$GithubProfileFromJson(Map<String, dynamic> json) =>
    GithubProfile(
      login: json['Login'] as String?,
      id: json['Id'] as int?,
      nodeId: json['NodeId'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gravatarId: json['GravatarId'] as String?,
      url: json['Url'] as String?,
      htmlUrl: json['HtmlUrl'] as String?,
      followersUrl: json['FollowersUrl'] as String?,
      followingUrl: json['FollowingUrl'] as String?,
      gistsUrl: json['GistsUrl'] as String?,
      starredUrl: json['StarredUrl'] as String?,
      subscriptionsUrl: json['SubscriptionsUrl'] as String?,
      organizationsUrl: json['OrganizationsUrl'] as String?,
      reposUrl: json['ReposUrl'] as String?,
      eventsUrl: json['EventsUrl'] as String?,
      receivedEventsUrl: json['ReceivedEventsUrl'] as String?,
      type: json['Type'] as String?,
      siteAdmin: json['SiteAdmin'] as bool?,
      name: json['Name'] as String?,
      company: json['Company'] as String?,
      blog: json['Blog'] as String?,
      location: json['Location'] as String?,
      email: json['Email'] as String?,
      hireable: json['Hireable'] as bool?,
      bio: json['Bio'] as String?,
    );

Map<String, dynamic> _$GithubProfileToJson(GithubProfile instance) =>
    <String, dynamic>{
      'Login': instance.login,
      'Id': instance.id,
      'NodeId': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'GravatarId': instance.gravatarId,
      'Url': instance.url,
      'HtmlUrl': instance.htmlUrl,
      'FollowersUrl': instance.followersUrl,
      'FollowingUrl': instance.followingUrl,
      'GistsUrl': instance.gistsUrl,
      'StarredUrl': instance.starredUrl,
      'SubscriptionsUrl': instance.subscriptionsUrl,
      'OrganizationsUrl': instance.organizationsUrl,
      'ReposUrl': instance.reposUrl,
      'EventsUrl': instance.eventsUrl,
      'ReceivedEventsUrl': instance.receivedEventsUrl,
      'Type': instance.type,
      'SiteAdmin': instance.siteAdmin,
      'Name': instance.name,
      'Company': instance.company,
      'Blog': instance.blog,
      'Location': instance.location,
      'Email': instance.email,
      'Hireable': instance.hireable,
      'Bio': instance.bio,
    };
