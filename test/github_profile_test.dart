import 'package:flutter_test/flutter_test.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/github_profile.dart';

void main() {
  const githubProfileJson = '''
{
  "login": "example_username",
  "id": 1234567890,
  "nodeId": "abcde12345",
  "avatarUrl": "https://example.com/avatar.jpg",
  "gravatarId": "gravatar123",
  "url": "https://api.github.com/users/example_username",
  "htmlUrl": "https://github.com/example_username",
  "followersUrl": "https://api.github.com/users/example_username/followers",
  "followingUrl": "https://api.github.com/users/example_username/following{/other_user}",
  "gistsUrl": "https://api.github.com/users/example_username/gists{/gist_id}",
  "starredUrl": "https://api.github.com/users/example_username/starred{/owner}{/repo}",
  "subscriptionsUrl": "https://api.github.com/users/example_username/subscriptions",
  "organizationsUrl": "https://api.github.com/users/example_username/orgs",
  "reposUrl": "https://api.github.com/users/example_username/repos",
  "eventsUrl": "https://api.github.com/users/example_username/events{/privacy}",
  "receivedEventsUrl": "https://api.github.com/users/example_username/received_events",
  "type": "User",
  "siteAdmin": false,
  "name": "John Doe",
  "company": "Example Company",
  "blog": "https://example.com",
  "location": "New York, USA",
  "email": "john.doe@example.com",
  "hireable": true,
  "bio": "Software Engineer | Open-source enthusiast"
}
''';

  test('github profile tojson', () async {
    final jsonBody = await githubProfileJson.ext
        .safeJsonDecodeCompute<Map<String, dynamic>>();
    expect(jsonBody, isNotNull);
    final user = GithubProfile.fromJson(jsonBody!);

    expect(user.toJson()['login'], 'example_username');
  });

  test('github profile equality', () async {
    final jsonBody = await githubProfileJson.ext
        .safeJsonDecodeCompute<Map<String, dynamic>>();
    expect(jsonBody, isNotNull);
    final user = GithubProfile.fromJson(jsonBody!);

    final user2 = GithubProfile.fromJson(jsonBody);

    expect(user == user2, isTrue);
  });

  test('github profile copyWith', () async {
    final jsonBody = await githubProfileJson.ext
        .safeJsonDecodeCompute<Map<String, dynamic>>();
    expect(jsonBody, isNotNull);
    final user = GithubProfile.fromJson(jsonBody!);

    final user2 = user.copyWith(name: 'John Doe 2');
    expect(user2.name, 'John Doe 2');

    expect(user.copyWith().login, 'example_username');
  });
}
