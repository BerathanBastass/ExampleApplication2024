import 'package:examplaapplication2024/core/app_localizations/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import '../cubit/profile_event.dart';
import '../../../core/utils/customcolors.dart';

class Profil extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String image = "assets/pinksale.png";
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return BlocProvider(
      create: (context) => UserProfileCubit()..loadUserProfile(),
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          backgroundColor: _theme.scaffoldBackgroundColor,
          title: Text(
            AppLocalizations.of(context).translate('profile'),
            style: TextStyle(fontSize: 35),
          ),
        ),
        backgroundColor: _theme.scaffoldBackgroundColor,
        body: BlocListener<UserProfileCubit, UserProfileState>(
          listener: (context, state) {
            if (state is UserProfileLoaded) {
              _usernameController.text = state.username;
              _descriptionController.text = state.description;
            }
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topImageContainer(image, context),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: const Offset(5, -200),
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundColor: CustomColors.orangeColor,
                              child: Icon(
                                Icons.account_circle,
                                size: 80,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -160),
                            child: ListTile(
                              title: TextFormField(
                                controller: _usernameController,
                                style: const TextStyle(fontSize: 25),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CustomColors.orangeColor),
                                  ),
                                  hintText: AppLocalizations.of(context)
                                      .translate('myusername'),
                                ),
                              ),
                              tileColor: CustomColors.orangeColor,
                              leading: const Icon(Icons.account_circle),
                              contentPadding: const EdgeInsets.all(13.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Transform.translate(
                            offset: Offset(0, -130),
                            child: ListTile(
                              title: TextFormField(
                                controller: _descriptionController,
                                style: const TextStyle(fontSize: 25),
                                decoration: InputDecoration.collapsed(
                                  hintText: AppLocalizations.of(context)
                                      .translate('mydescription'),
                                ),
                                maxLength: 50,
                              ),
                              tileColor: CustomColors.orangeColor,
                              leading: const Icon(Icons.edit),
                              contentPadding: const EdgeInsets.all(20.0),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Transform.translate(
                            offset: Offset(0, -100),
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<UserProfileCubit>()
                                    .updateUserProfile(
                                      _usernameController.text,
                                      _descriptionController.text,
                                    );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    CustomColors.orangeColor),
                              ),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('savechanges'),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topImageContainer(String image, BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Transform.translate(
      offset: const Offset(50, -100),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          _theme.scaffoldBackgroundColor!,
          BlendMode.modulate,
        ),
        child: Container(
          child: Image.asset(
            image,
            height: 300,
          ),
        ),
      ),
    );
  }
}
