import 'package:examplaapplication2024/core/utils/customColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_localizations/app_localization.dart';
import '../../../core/enums/enums.dart';
import '../../../core/shared_preferences/shared_pref_helper.dart';
import '../../helpers.dart/theme_model.dart';
import '../cubit/settings_cubit.dart';
import 'theme_radio.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => CombinedScreenState();
}

class CombinedScreenState extends State<Settings> {
  List<ThemeModel>? _themeModels;
  int selectedCardIndex = -1;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        _themeModels = <ThemeModel>[
          ThemeModel(
            AppLocalizations.of(context).translate('lightmode'),
            Icons.wb_sunny,
            false,
          ),
          ThemeModel(
            AppLocalizations.of(context).translate('darkmode'),
            Icons.tonality_outlined,
            false,
          ),
          ThemeModel(AppLocalizations.of(context).translate('auto'),
              Icons.brightness_auto, false)
        ];

        _themeModels![context.read<ChangeThemeCubit>().getTheme()].isSelected =
            true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context).translate('theme'),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: _theme.primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: _themeModels != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<ChangeThemeCubit>()
                                      .setThemeMode(0);
                                  _themeModels![0].isSelected = true;
                                  _themeModels![1].isSelected = false;
                                  _themeModels![2].isSelected = false;
                                });
                              },
                              child: ThemeRadio(_themeModels![0]),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<ChangeThemeCubit>()
                                      .setThemeMode(1);
                                  _themeModels![0].isSelected = false;
                                  _themeModels![1].isSelected = true;
                                  _themeModels![2].isSelected = false;
                                });
                              },
                              child: ThemeRadio(_themeModels![1]),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<ChangeThemeCubit>()
                                      .setThemeMode(2);
                                  _themeModels![0].isSelected = false;
                                  _themeModels![1].isSelected = false;
                                  _themeModels![2].isSelected = true;
                                });
                              },
                              child: ThemeRadio(_themeModels![2]),
                            )
                          ],
                        )
                      : Container(),
                ),
                Transform.translate(
                  offset: Offset(-140, 110),
                  child: Text(
                    AppLocalizations.of(context).translate("language"),
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(height: 50),
                Transform.translate(
                  offset: Offset(0, 70),
                  child: SizedBox(
                    child: buildCard(
                        0,
                        AppLocalizations.of(context).translate('english'),
                        FontAwesomeIcons.globe),
                  ),
                ),
                const SizedBox(height: 30),
                Transform.translate(
                  offset: Offset(0, 70),
                  child: buildCard(
                      1,
                      AppLocalizations.of(context).translate('turkish'),
                      FontAwesomeIcons.globe),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(int index, String language, IconData iconData) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(15),
      color:
          selectedCardIndex == index ? CustomColors.orangeColor : Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCardIndex = index;
          });

          if (index == 0) {
            SharedPreferencesHelper.setData('lang', 'en');
            BlocProvider.of<LocalizationCubit>(context)
                .appLanguageFunction(LanguagesTypesEnums.english);
          } else if (index == 1) {
            SharedPreferencesHelper.setData('lang', 'tr');
            BlocProvider.of<LocalizationCubit>(context)
                .appLanguageFunction(LanguagesTypesEnums.turkey);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                language,
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                iconData,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
