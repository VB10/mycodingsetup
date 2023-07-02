import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/models/user_detail.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';

final class HomeDetailViewModel {
  HomeDetailViewModel(this.user);

  final BaseFirebaseModel<User> user;

  Future<(User, UserDetail?)> fetchUserDetail() async {
    final userDetailQeury = FirebaseQueries.userDetail.reference;

    final response = await userDetailQeury
        .doc(user.id)
        .withConverter<BaseFirebaseModel<UserDetail>?>(
          fromFirestore: (snapshot, options) {
            if (snapshot.data()?.isEmpty ?? true) return null;
            return BaseFirebaseModel(
              id: snapshot.id,
              data: UserDetail.fromJson(snapshot.data()!),
            );
          },
          toFirestore: (value, options) => throw Exception('-'),
        )
        .get();

    return (user.data, response.data()?.data);
  }
}
