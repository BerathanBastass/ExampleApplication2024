import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/helpers.dart/theme_model.dart';

class ThemeRadio extends StatelessWidget {
  const ThemeRadio(this._themeModel, {Key? key}) : super(key: key);
  final ThemeModel _themeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _themeModel.isSelected ? const Color(0xffFA632B) : Colors.white,
      child: Container(
        height: 120,
        width: 95,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              _themeModel.icon,
              color: _themeModel.isSelected ? Colors.white : Colors.grey,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              _themeModel.name,
              style: TextStyle(
                color: _themeModel.isSelected ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
