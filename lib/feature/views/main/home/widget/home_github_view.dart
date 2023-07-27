part of '../home_view.dart';

class _ListBodyItems extends StatelessWidget {
  const _ListBodyItems({
    required this.userListNotifier,
  });

  final ValueNotifier<List<BaseFirebaseModel<User>>> userListNotifier;

  @override
  Widget build(BuildContext context) {
    return _UserBuilderList(userListNotifier: userListNotifier);
  }
}

class _UserBuilderList extends StatelessWidget {
  const _UserBuilderList({
    required this.userListNotifier,
  });

  final ValueNotifier<List<BaseFirebaseModel<User>>> userListNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BaseFirebaseModel<User>>>(
      valueListenable: userListNotifier,
      builder: (context, value, child) {
        if (value.isEmpty) return const SizedBox.shrink();

        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: context.padding.onlyBottomNormal,
          itemCount: value.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _UserCard(id: value[index].id, user: value[index].data);
          },
        );
      },
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.id, required this.user});
  final User user;
  final String id;
  @override
  Widget build(BuildContext context) {
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
