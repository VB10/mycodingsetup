part of '../home_view.dart';

class _GithubExtensionView extends StatelessWidget {
  const _GithubExtensionView(this.mapUserFilterListener);
  final ValueNotifier<Map<UserFilterQuery, List<User>>> mapUserFilterListener;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: mapUserFilterListener,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.home_ratingAndReview.tr(),
              style: context.general.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            context.sized.emptySizedHeightBoxLow,
            GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final user =
                    mapUserFilterListener.value.values.elementAt(index);
                final query = mapUserFilterListener.value.keys.elementAt(index);
                return RatingReviewCard(
                  users: user,
                  query: query,
                );
              },
              itemCount: mapUserFilterListener.value.length,
            ),
          ],
        );
      },
    );
  }
}
