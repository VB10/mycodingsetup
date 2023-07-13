import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/models/user_detail.dart';
import 'package:mycodingsetup/feature/views/home/mixin/home_detail_view_mixin.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView({required this.user, super.key});
  final BaseFirebaseModel<User> user;
  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView>
    with HomeDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.photo ?? ''),
          ),
          Text(widget.user.data.name ?? ''),
          ValueListenableBuilder(
            valueListenable: userDetailNotifier,
            builder: (context, value, child) {
              if (value == null) return const SizedBox.shrink();

              return _UserDetailCard(userDetail: value);
            },
          )
        ],
      ),
    );
  }
}

class _UserDetailCard extends StatelessWidget {
  const _UserDetailCard({required this.userDetail});
  final UserDetail userDetail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Computer: ${userDetail.computer}'),
        TextButton(
          onPressed: () {
            userDetail.computerUrl.ext.launchWebsite;
          },
          child: Text(
            'Computer url: ${userDetail.computerUrl}',
            style: context.general.textTheme.bodyMedium?.copyWith(
              color: context.general.colorScheme.secondary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text('Theme: ${userDetail.theme}'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: userDetail.extensions?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Text('- ${userDetail.extensions?[index]}');
          },
        ),
        if (userDetail.settingValue.ext.isNotNullOrNoEmpty)
          InkWell(
            child: JsonView.string(userDetail.settingValue!),
            onLongPress: () {
              userDetail.settingValue.ext.share();
            },
          )
      ],
    );
  }
}
