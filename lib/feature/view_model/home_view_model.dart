import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';

final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;
  // CollectionReference<Map<String, dynamic>> queries(FirebaseQueries query) {
  //   return query.reference;
  // }
}
