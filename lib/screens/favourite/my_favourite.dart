import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/provider/favourite_provider.dart';

class MyFavoriteItemScreen extends StatefulWidget {
  const MyFavoriteItemScreen({super.key});

  @override
  State<MyFavoriteItemScreen> createState() => _MyFavoriteItemScreenState();
}

class _MyFavoriteItemScreenState extends State<MyFavoriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyFavoriteItemScreen();
              }));
            },
            child: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favouriteProvider.seletedItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item ${index.toString()}"),
                      trailing: favouriteProvider.seletedItems.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                    );
                  }))
        ],
      ),
    );
  }
}
