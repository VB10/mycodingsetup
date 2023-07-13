import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/views/main/home/home_view.dart';
import 'package:mycodingsetup/feature/views/main/tab/main_tab_view.dart';

mixin MainTabViewMixin on State<MainTabView> {
  static const List<Widget> tabBarViews = [
    HomeView(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  static const List<Tab> tabItems = [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.favorite)),
    Tab(icon: Icon(Icons.person)),
  ];
}

enum MainTabItems {
  home(HomeView(), Tab(icon: Icon(Icons.home))),
  search(SizedBox(), Tab(icon: Icon(Icons.search))),
  favorite(SizedBox(), Tab(icon: Icon(Icons.favorite))),
  profile(SizedBox(), Tab(icon: Icon(Icons.person)));

  final Widget widget;
  final Tab tab;
  const MainTabItems(this.widget, this.tab);

  static List<Widget> get views => values.map((e) => e.widget).toList();
  static List<Tab> get tabs => values.map((e) => e.tab).toList();
}
