import 'package:flutter/cupertino.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/models/user_detail.dart';
import 'package:mycodingsetup/feature/view_model/index.dart';

import 'package:mycodingsetup/feature/views/home/home_detail_view.dart';

mixin HomeDetailViewMixin on State<HomeDetailView> {
  late final HomeDetailViewModel _detailViewModel;
  final ValueNotifier<UserDetail?> userDetailNotifier = ValueNotifier(null);
  late final User user;
  @override
  void initState() {
    super.initState();
    user = widget.user.data;
    _detailViewModel = HomeDetailViewModel(widget.user);
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final (_, userDetail) = await _detailViewModel.fetchUserDetail();
    userDetailNotifier.value = userDetail;
  }
}
