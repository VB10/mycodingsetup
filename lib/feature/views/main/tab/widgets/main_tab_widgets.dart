part of '../main_tab_view.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final userPhotoUrl = context.read<UserContext>().userState.user.photo;
    return AppBar(
      title: const Text('CodingSetup'),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        CircleAvatar(
          backgroundImage: userPhotoUrl.ext.isNotNullOrNoEmpty
              ? NetworkImage(userPhotoUrl!)
              : null,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BottomAppBar();
  static const _notchMarginSize = 10.0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: context.general.colorScheme.onBackground,
      notchMargin: _notchMarginSize,
      clipBehavior: Clip.antiAlias,
      elevation: AppConstants.kZero,
      shape: const CircularNotchedRectangle(),
      child: const TabBar(
        tabs: MainTabViewMixin.tabItems,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
