import 'package:examplaapplication2024/feature/settings/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_localizations/app_localization.dart';
import 'core/app_localizations/enums/enums.dart';
import 'feature/favorites/cubit/layot_cubit.dart';
import 'feature/profile/cubit/profile_event.dart';
import 'feature/tabbarr/views/electronic/cubit/electornic_cubit.dart';
import 'feature/tabbarr/views/female/cubit/female_cubit.dart';
import 'feature/tabbarr/views/mixed/cubit/mixed_cubit.dart';
import 'feature/users/cubit/users_cubit.dart';
import 'core/helpers.dart/helper.dart';
import 'feature/settings/cubit/change_state.dart';
import 'feature/settings/cubit/settings_cubit.dart';
import 'feature/bottombar/view/bottombar.dart';
import 'feature/favorites/view/favorites.dart';
import 'feature/tabbarr/tabbar.dart';
import 'feature/profile/view/profile.dart';
import 'feature/tabbarr/views/mixed/ui/view/mixed_screen.dart';
import 'feature/auth/sıgn_ın/view/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.mainSharedPreferences = await SharedPreferences.getInstance();
  final themeIndex = MyApp.mainSharedPreferences!.getInt('selectedThemeIndex');
  if (themeIndex == null) {
    await MyApp.mainSharedPreferences!.setInt('selectedThemeIndex', 1);
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
        BlocProvider<UserProfileCubit>(create: (context) => UserProfileCubit()),
        BlocProvider<FemaleCubit>(create: (context) => FemaleCubit()),
        BlocProvider<ElectronicCubit>(create: (context) => ElectronicCubit()),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit()
            ..appLanguageFunction(LanguagesTypesEnums.initial),
        ),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, ChangeThemeState themeState) {
          return BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
              if (state is ChangeAppLanguage) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  routes: {
                    "/loginPage": (context) => const LoginScreen(),
                    "/homePage": (context) => const HomePage(),
                    "/bottomBar": (context) => const BottomBar(),
                    "/favorites": (context) => Favorites(),
                    "/profile": (context) => Profil(),
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
                  home: const LoginScreen(),
                  locale: Locale(state.languageCode!),
                  supportedLocales: const [
                    Locale('en'),
                    Locale('tr'),
                  ],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null) {
                        if (deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                    }
                    return supportedLocales.first;
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
