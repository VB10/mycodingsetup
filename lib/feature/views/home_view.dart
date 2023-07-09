import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/view_model/home_view_model.dart';
import 'package:mycodingsetup/feature/views/home_detail_view.dart';
import 'package:mycodingsetup/feature/views/home_form_view.dart';
import 'package:mycodingsetup/feature/views/home_search_delegate.dart';
import 'package:mycodingsetup/product/generation/assets.gen.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';
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
          _GithubLoginButton(homeViewModel: _homeViewModel),
          IconButton(
            onPressed: () async {
              final items = await _homeViewModel.usersQuery
                  .withConverter<BaseFirebaseModel<User>?>(
                    fromFirestore: (snapshot, options) {
                      if (snapshot.data()?.isEmpty ?? true) return null;
                      return BaseFirebaseModel(
                        id: snapshot.id,
                        data: User.fromJson(snapshot.data()!),
                      );
                    },
                    toFirestore: (value, options) => throw Exception('-'),
                  )
                  .get();

              final userItems = items.docs
                  .map((e) => e.data()?.data)
                  .where((element) => element != null)
                  .cast<User>()
                  .toList();
              if (!mounted) return;
              final response = await showSearch<String?>(
                context: context,
                delegate: HomeSearchDelegate(
                  userItems,
                ),
              );

              if (response == null) return;
              // TODO:
            },
            icon: const Icon(Icons.search),
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

class _GithubLoginButton extends StatelessWidget {
  const _GithubLoginButton({
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;

  final HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final isAuthenticated = await _homeViewModel.checkUserGithubLogin();
        if (!context.mounted) return;
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
        child: Assets.icGithub.image(),
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
