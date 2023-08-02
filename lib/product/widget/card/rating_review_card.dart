import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/view_model/home/home_view_model.dart';
import 'package:mycodingsetup/product/utility/translation/locale_keys.g.dart';

class RatingReviewCard extends StatelessWidget {
  const RatingReviewCard({required this.users, required this.query, super.key});
  final List<User> users;
  final UserFilterQuery query;
  @override
  Widget build(BuildContext context) {
    final randomUserIndex =
        Random().nextInt(users.isEmpty ? 5 : users.length + 1);
    final firstUserPhotoUrl =
        users.elementAtOrNull(randomUserIndex)?.photo ?? '';
    return Card(
      child: Padding(
        padding: context.padding.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: context.general.colorScheme.onError,
                  child: Icon(
                    Icons.star,
                    color: context.general.colorScheme.onSecondary,
                  ),
                ),
                const Spacer(),
                if (firstUserPhotoUrl.isNotEmpty)
                  CircleAvatar(
                    backgroundImage: NetworkImage(firstUserPhotoUrl),
                  ),
              ],
            ),
            const Spacer(),
            Text('${users.length} News'),
            Text(
              query.name.toUpperCase(),
              style: context.general.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Expanded(
                  child: LinearProgressIndicator(
                    value: 0.5,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.general_viewAll.tr(),
                    style: context.general.textTheme.bodySmall?.copyWith(
                      color: context.general.colorScheme.onSecondary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
