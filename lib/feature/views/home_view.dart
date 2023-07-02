import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/view_model/home_view_model.dart';
import 'package:mycodingsetup/feature/views/home_detail_view.dart';
import 'package:mycodingsetup/feature/views/home_form_view.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';
import 'package:mycodingsetup/product/utility/image_constants.dart';
import 'package:mycodingsetup/product/utility/locale_keys.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.titleName,
          style: context.general.textTheme.titleMedium,
        ),
        actions: [
          InkWell(
            onTap: () async {
              final isAuthenticated =
                  await _homeViewModel.checkUserGithubLogin();
              if (!mounted) return;
              if (!isAuthenticated) return;
              if (_homeViewModel.user == null) return;
              await context.route.navigateToPage(
                HomeFormView(
                  user: _homeViewModel.user!,
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: context.general.colorScheme.secondary,
              child: Image.asset(ImageConstants.icGithub),
            ),
          )
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        query: _homeViewModel.usersQuery,
        itemBuilder: (context, snapshot) {
          final userMap = snapshot.data();
          if (userMap.isEmpty) return const SizedBox.shrink();

          return _UserCard(mapUser: userMap, id: snapshot.id);
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.mapUser, required this.id});
  final Map<String, dynamic> mapUser;
  final String id;
  @override
  Widget build(BuildContext context) {
    final user = User.fromJson(mapUser);

    if (user.isEmpty) return const SizedBox.shrink();

    return Card(
      child: ListTile(
        onTap: () {
          context.route.navigateToPage(
            HomeDetailView(
              user: BaseFirebaseModel<User>(id: id, data: user),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.photo!),
        ),
        title: Text(user.name!),
        subtitle: Text(user.shortBio!),
      ),
    );
  }
}
