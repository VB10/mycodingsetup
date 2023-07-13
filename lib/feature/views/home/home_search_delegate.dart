import 'package:flutter/material.dart';

import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';

class HomeSearchDelegate extends SearchDelegate<String?> {
  HomeSearchDelegate(this.items);

  final List<BaseFirebaseModel<User>> items;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Search term must be longer than two letters.',
            ),
          )
        ],
      );
    }

    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using
    final results = items.where(
      (element) => element.data.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results.elementAt(index).data.name ?? ''),
          onTap: () {
            close(context, results.elementAt(index).id);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return const Column();
  }
}
