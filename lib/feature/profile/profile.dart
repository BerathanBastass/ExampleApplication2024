import 'package:examplaapplication2024/core/sized_box/sizedbox.dart';
import 'package:examplaapplication2024/feature/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/customcolors.dart';
import 'cubit/profile_event.dart';

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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CustomColors.pageColor,
          title: const Text("Profile"),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: Icon(FontAwesomeIcons.gear))),
      backgroundColor: CustomColors.pageColor,
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
      backgroundColor: Colors.orange,
      child: Icon(FontAwesomeIcons.user),
    );
  }

  ListTile _UsernameTile() {
    return ListTile(
      title: TextFormField(
        style: TextStyle(fontSize: 20),
        decoration: const InputDecoration(hintText: "My Username"),
      ),
      tileColor: Colors.orange,
      leading: const Icon(FontAwesomeIcons.user),
      contentPadding: const EdgeInsets.all(10.0),
    );
  }

  ListTile _DescriptionTile() {
    return ListTile(
      title: TextFormField(
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration.collapsed(hintText: "My description"),
      ),
      tileColor: Colors.orange,
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
          backgroundColor: MaterialStatePropertyAll(Colors.orange)),
      child: const Text(
        "Save Changes",
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  topImageContainer(String image) {
    return Transform.translate(
      offset: Offset(-10, -30),
      child: Image.asset(
        image,
        color: Colors.orange,
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
