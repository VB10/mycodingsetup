part of '../home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    final user = auth.FirebaseAuth.instance.currentUser;
  }

  Future<void> onGithubPressed() async {
    final isAuthenticated = await _homeViewModel.checkUserGithubLogin();
    if (!context.mounted) return;
    if (!isAuthenticated) return;
    if (_homeViewModel.user == null) return;

    await context.route.navigateToPage(
      HomeFormView(
        user: _homeViewModel.user!,
      ),
    );
  }

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
    final foundedUser = userItems.firstWhereOrNull(
      (BaseFirebaseModel<User> user) => user.id == response,
    );
    if (foundedUser == null) return;

    await context.route.navigateToPage(
      HomeDetailView(
        user: foundedUser,
      ),
    );
  }
}
