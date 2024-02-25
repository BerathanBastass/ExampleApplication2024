import 'package:examplaapplication2024/feature/favorites/cubit/layot_cubit.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/detail/mixed_detal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/cubit/settings_cubit.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
    final finalList = cubit.favorites;
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        title: Text(
          "Favorites",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Visibility(
            visible: finalList.isEmpty,
            child: Transform.translate(
              offset: Offset(1, 150),
              child: Center(
                child: Text(
                  "Herhangi Bir Ürünü Favorilemediniz!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MixedDetailPage(product: finalList[index]),
                      ),
                    );
                  },
                  child: Dismissible(
                    key: Key(finalList[index].title),
                    onDismissed: (direction) {
                      cubit.toggleFavorites(finalList[index]);
                    },
                    background: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.delete,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        finalList[index].title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        finalList[index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(finalList[index].image),
                      ),
                      trailing: Text(
                        '\$${finalList[index].price}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
