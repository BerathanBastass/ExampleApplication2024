import 'package:examplaapplication2024/feature/favorites/cubit/layot_cubit.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/cubit/mixed_cubit.dart';
import 'package:examplaapplication2024/feature/users/cubit/users_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:examplaapplication2024/feature/helpers.dart/helper.dart';

import 'package:examplaapplication2024/feature/settings/cubit/change_state.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:examplaapplication2024/feature/bottombar/view/bottombar.dart';
import 'package:examplaapplication2024/feature/favorites/view/favorites.dart';
import 'package:examplaapplication2024/feature/tabbarr/tabbar.dart';
import 'package:examplaapplication2024/feature/profile/view/profile.dart';
import 'package:examplaapplication2024/feature/settings/view/settings.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/view/mixed_screen.dart';
import 'feature/auth/sıgn_ın/view/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.mainSharedPreferences = await SharedPreferences.getInstance();
  final themeIndex = MyApp.mainSharedPreferences!.getInt('selectedThemeIndex');
  if (themeIndex == null) {
    await MyApp.mainSharedPreferences!.setInt('selectedThemeIndex', 2);
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static SharedPreferences? mainSharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeThemeCubit>(create: (context) => ChangeThemeCubit()),
        BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit()),
        BlocProvider<MixedCubit>(create: (context) => MixedCubit()),
        BlocProvider<UsersCubit>(create: (context) => UsersCubit()),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, ChangeThemeState themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routes: {
              "/loginPage": (context) => const LoginScreen(),
              "/homePage": (context) => const HomePage(),
              "/bottomBar": (context) => const BottomBar(),
              "/favorites": (context) => Favorites(),
              "/profile": (context) => const Profil(),
              "/mixedScreen": (context) => MixedScreen(),
              "/settingsScreen": (context) => Settings(),
            },
            darkTheme: (themeState is ThemeAutoState)
                ? buildThemeData(myThemes[1])
                : (themeState is ThemeLightState)
                    ? buildThemeData(myThemes[0])
                    : buildThemeData(myThemes[1]),
            theme: (themeState is ThemeAutoState)
                ? buildThemeData(myThemes[0])
                : (themeState is ThemeLightState)
                    ? buildThemeData(myThemes[0])
                    : buildThemeData(myThemes[1]),
            home: const BottomBar(),
          );
        },
      ),
    );
  }
}
