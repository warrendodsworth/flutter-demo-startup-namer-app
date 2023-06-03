import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var color = Theme.of(context).colorScheme;

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Words'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('You have '
                  '${appState.favorites.length} favorites:'),
            ),
            for (var pair in appState.favorites)
              ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: color.primary,
                  ),
                  title: Text('${pair.first} ${pair.second}'),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel_outlined),
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                  )),
          ],
        ),
      ),
      //
    );
  }
}

// Other way of doing it with ListView.builder, suggested by copilot
// body: ListView.builder(
//   itemCount: appState.favorites.length,
//   itemBuilder: (context, index) {
//     final pair = appState.favorites[index];
//     return ListTile(
//       title: Text(pair.asPascalCase),
//       trailing: IconButton(
//         icon: Icon(Icons.cancel_outlined),
//         onPressed: () {
//           appState.removeFavorite(pair);
//         },
//       ),
//     );
//   },
// ),
