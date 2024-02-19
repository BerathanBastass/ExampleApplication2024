import 'dart:io';

import 'package:examplaapplication2024/feature/users/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
