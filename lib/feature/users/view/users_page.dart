import 'dart:io';
import 'package:examplaapplication2024/feature/users/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final Dio dio = Dio();
  final String url = 'https://api.escuelajs.co/api/v1/users';
  List<Root> users = [];

  Future<void> getData() async {
    var response = await dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;
      if (data is List) {
        setState(() {
          users = data.map((e) => Root.fromJson(e)).toList();
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          String? avatarUrl = users[index].avatar;
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  avatarUrl != null ? NetworkImage(avatarUrl) : null,
              child:
                  avatarUrl == null ? Image.asset('pinksale.daily.jpeg') : null,
            ),
            title: Text(users[index].name.toString()),
            trailing: Icon(FontAwesomeIcons.magnifyingGlass),
          );
        },
      ),
    );
  }
}
