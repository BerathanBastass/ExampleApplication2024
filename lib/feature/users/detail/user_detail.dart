import 'package:flutter/material.dart';

import 'package:examplaapplication2024/feature/users/model/users_model.dart';

class UserDetailPage extends StatefulWidget {
  UserDetailPage({super.key, required this.users});
  final Root users;
  List<Root> user = [];

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
