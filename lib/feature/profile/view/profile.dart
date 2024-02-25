import 'package:examplaapplication2024/core/sized_box/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/customcolors.dart';
import '../cubit/profile_event.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late ProfilCubit profilCubit;

  @override
  void initState() {
    super.initState();
    profilCubit = ProfilCubit();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String image = "assets/pinksale.png";
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: _theme.scaffoldBackgroundColor,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 35),
        ),
      ),
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: appBody(height, image),
    );
  }

  SingleChildScrollView appBody(double height, String image) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageContainer(image),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(5, -70),
                      child: _CircleAvatars(),
                    ),
                    _UsernameTile(),
                    sbxh(),
                    _DescriptionTile(),
                    sbxh(),
                    _SaveButtons()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar _CircleAvatars() {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: CustomColors.orangeColor,
      child: Icon(FontAwesomeIcons.user),
    );
  }

  ListTile _UsernameTile() {
    return ListTile(
      title: TextFormField(
        style: TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.orangeColor),
          ),
          hintText: "My Username",
        ),
      ),
      tileColor: CustomColors.orangeColor,
      leading: const Icon(FontAwesomeIcons.user),
      contentPadding: const EdgeInsets.all(10.0),
    );
  }

  ListTile _DescriptionTile() {
    return ListTile(
      title: TextFormField(
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration.collapsed(hintText: "My description"),
        maxLength: 50,
      ),
      tileColor: CustomColors.orangeColor,
      leading: Icon(FontAwesomeIcons.penToSquare),
      contentPadding: const EdgeInsets.all(20.0),
    );
  }

  ElevatedButton _SaveButtons() {
    return ElevatedButton(
      onPressed: () {
        profilCubit.saveChanges();
      },
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(CustomColors.orangeColor)),
      child: const Text(
        "Save Changes",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  topImageContainer(String image) {
    return Transform.translate(
      offset: Offset(-10, -30),
      child: Image.asset(
        image,
        color: CustomColors.orangeColor,
        height: 200,
      ),
    );
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
