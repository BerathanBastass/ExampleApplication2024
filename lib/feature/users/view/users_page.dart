import 'package:examplaapplication2024/feature/users/cubit/users_cubit.dart';
import 'package:examplaapplication2024/feature/users/cubit/users_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    context.read<UsersCubit>().getUser();
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is InitUsersState || state is LoadingUsersState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ResponseUsersState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                String? avatarUrl = state.users[index].avatar;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        avatarUrl != null ? NetworkImage(avatarUrl) : null,
                    child: avatarUrl == null
                        ? Image.asset('pinksale.daily.jpeg')
                        : null,
                  ),
                  title: Text(state.users[index].name.toString()),
                  trailing: Icon(FontAwesomeIcons.magnifyingGlass),
                );
              },
            );
          } else if (state is ErrorUsersState) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }

          return Container();
        },
      ),
    );
  }
}
