part of '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  Future<void> searchClicked() async {
    final userItems = await _homeViewModel.getUserList();
    if (!mounted) return;
    final response = await showSearch<String?>(
      context: context,
      delegate: HomeSearchDelegate(
        userItems,
      ),
    );
    if (response == null) return;
    if (!mounted) return;
    final foundedUser = userItems.firstWhereOrNull((BaseFirebaseModel<User> user) => user.id == response);
    if (foundedUser == null) return;

    await context.route.navigateToPage(
      HomeDetailView(
        user: foundedUser,
      ),
    );
  }
}
