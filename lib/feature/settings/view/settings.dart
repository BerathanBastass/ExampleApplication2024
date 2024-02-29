import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/app_localizations/app_localization.dart';
import '../../../core/app_localizations/enums/enums.dart';
import '../../../core/shared_preferences/shared_pref_helper.dart';
import '../../../core/utils/customColors.dart';
import '../../../core/helpers.dart/theme_model.dart';
import '../cubit/settings_cubit.dart';
import 'theme_radio.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    List<ThemeModel> _themeModels = [
      ThemeModel(
        AppLocalizations.of(context).translate('lightmode'),
        Icons.wb_sunny,
        context.read<ChangeThemeCubit>().getTheme() == 0,
      ),
      ThemeModel(
        AppLocalizations.of(context).translate('darkmode'),
        Icons.tonality_outlined,
        context.read<ChangeThemeCubit>().getTheme() == 1,
      ),
    ];

    int selectedCardIndex =
        SharedPreferencesHelper.getData('lang') == 'en' ? 0 : 1;

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
                                context
                                    .read<ChangeThemeCubit>()
                                    .setThemeMode(0);
                              },
                              child: ThemeRadio(_themeModels[0]),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ChangeThemeCubit>()
                                    .setThemeMode(1);
                              },
                              child: ThemeRadio(_themeModels[1]),
                            ),
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
                      FontAwesomeIcons.globe,
                      selectedCardIndex == 0,
                      () {
                        context
                            .read<LocalizationCubit>()
                            .appLanguageFunction(LanguagesTypesEnums.english);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Transform.translate(
                  offset: Offset(0, 70),
                  child: buildCard(
                    1,
                    AppLocalizations.of(context).translate('turkish'),
                    FontAwesomeIcons.globe,
                    selectedCardIndex == 1,
                    () {
                      context
                          .read<LocalizationCubit>()
                          .appLanguageFunction(LanguagesTypesEnums.turkey);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(int index, String language, IconData iconData,
      bool isSelected, VoidCallback onTap) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(15),
      color: isSelected ? CustomColors.orangeColor : Colors.white,
      child: InkWell(
        onTap: onTap,
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
                color: CustomColors.saltWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
