import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/models/user_detail.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';

import 'package:mycodingsetup/feature/views/main/home/mixin/home_form_view_mixin.dart';

final class HomeFormViewModel {
  HomeFormViewModel(User user) : _user = user;

  final User _user;

  Future<UserDetail?> checkUserBasicInformation() async {
    final userDetailSnapShot =
        await FirebaseQueries.userDetail.reference.doc(_getUserId()).get();

    if (!userDetailSnapShot.exists) return null;
    final jsonData = userDetailSnapShot.data();
    if (jsonData == null) return null;

    final userDetail = UserDetail.fromJson(jsonData);
    return userDetail;
  }

  String _getUserId() {
    final userId = _user.githubId.toString();
    if (userId.isEmpty) throw Exception('user id is not null');
    return userId;
  }

  Future<bool> saveUserDataToBackend(HomeFormModel model) async {
    if (model.isEmpty) return false;
    final localUserId = _getUserId();
    final itemExtensionsSpitted = model.extensions.split(',');
    final itemExtensions = itemExtensionsSpitted.map((e) => e.trim()).toList();
    // 1. user data to backend

    await FirebaseQueries.users.reference.doc(localUserId).set(_user.toJson());

    // 2. user details to backend
    final userDetail = UserDetail(
      computer: model.computerName,
      computerUrl: model.computerUrl,
      extensions: itemExtensions,
      settingValue: model.settingValue,
      theme: model.theme,
    );
    final _ = await FirebaseQueries.userDetail.reference
        .doc(localUserId)
        .set(userDetail.toJson());

    return true;
  }
}
