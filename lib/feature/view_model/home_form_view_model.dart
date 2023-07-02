import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/models/user_detail.dart';
import 'package:mycodingsetup/feature/views/mixin/home_form_view_mixin.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';

final class HomeFormViewModel {
  HomeFormViewModel(this.user);

  final User user;
  Future<bool> saveUserDataToBackend(HomeFormModel model) async {
    final itemExtensionsSpitted = model.extensions.split(',');
    final itemExtensions = itemExtensionsSpitted.map((e) => e.trim()).toList();
    // 1. user data to backend
    final userResponse =
        await FirebaseQueries.users.reference.add(user.toJson());

    // 2. user details to backend
    final userDetail = UserDetail(
      computer: model.computerName,
      computerUrl: model.computerUrl,
      extensions: itemExtensions,
      settingValue: model.settingValue,
      theme: model.theme,
    );
    final _ = await FirebaseQueries.userDetail.reference
        .doc(userResponse.id)
        .set(userDetail.toJson());

    return true;
  }
}
