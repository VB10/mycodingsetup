import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/sub_feature/user_profile_avatar.dart';
import 'package:mycodingsetup/feature/views/main/tab/main_tab_view_mixin.dart';
import 'package:mycodingsetup/product/utility/app_constant.dart';

part './widgets/main_tab_widgets.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MainTabItems.values.length,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
          children: MainTabViewMixin.tabBarViews,
        ),
        bottomNavigationBar: const _BottomAppBar(),
        appBar: const _AppBar(),
      ),
    );
  }
}
