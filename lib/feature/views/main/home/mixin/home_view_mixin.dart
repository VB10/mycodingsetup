part of '../home_view.dart';

enum HomeTabItems { github, extension }

mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  ValueNotifier<List<BaseFirebaseModel<User>>> userListNotifier =
      ValueNotifier<List<BaseFirebaseModel<User>>>([]);

  ValueNotifier<HomeTabItems> homeTabListener =
      ValueNotifier<HomeTabItems>(HomeTabItems.extension);

  ValueNotifier<Map<UserFilterQuery, List<User>>> mapUserFilterListener =
      ValueNotifier<Map<UserFilterQuery, List<User>>>({});

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void updateExtensionOrGithub(HomeTabItems item) {
    if (homeTabListener.value == item) return;
    homeTabListener.value = item;
  }

  Future<void> _initialize() async {
    await _homeViewModel.fetchAllUserInformation();
    _homeViewModel.makeFilter();
    mapUserFilterListener.value = _homeViewModel.filterQueryMap;
    userListNotifier.value = _homeViewModel.userList;
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
