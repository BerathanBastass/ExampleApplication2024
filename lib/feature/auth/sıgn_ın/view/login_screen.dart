import 'package:examplaapplication2024/feature/auth/s%C4%B1gn_%C4%B1n/interaces/login_interface.dart';
import 'package:examplaapplication2024/feature/bottombar/view/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/auth/s%C4%B1gn_%C4%B1n/model/user_model.dart';
import 'package:examplaapplication2024/feature/auth/s%C4%B1gn_%C4%B1n/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/images/images.dart';
import 'package:sign_button/sign_button.dart';
import 'package:examplaapplication2024/core/sized_box/sizedbox.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> with TickerProviderStateMixin {
  final ILogin _loginService = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
    _checkUserLoginStatus();
  }

  Future<void> _checkUserLoginStatus() async {
    final userEmail = await _getUserEmail();
    if (userEmail != null && userEmail.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => BottomBar(),
        ),
      );
    }
  }

  Future<void> _saveUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
  }

  Future<void> _clearUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  Future<String?> _getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    tabBar(),
                    sbxw(),
                    emailTextField(),
                    sbxh(),
                    passwordTextField(),
                    signUpButton(),
                    rememberMe(),
                    loginButton(),
                    sbxh(),
                    orText(),
                    sbxh(),
                    signUsingText(),
                    socialMediaButtons(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DefaultTabController tabBar() {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(children: [
          Transform.translate(
            offset: Offset(0, -70),
            child: TabBar(
              indicatorColor: CustomColors.orangeColor,
              labelStyle: const TextStyle(color: CustomColors.orangeColor),
              unselectedLabelColor: Colors.grey,
              controller: _controller,
              tabs: const [
                Tab(
                  child: Text(
                    'Sıgn In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sıgn Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.orangeColor),
        ),
        labelText: "E-mail Address",
        labelStyle: TextStyle(color: CustomColors.orangeColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onEditingComplete: () async {
        UserModel? response = await _loginService.login(
            _emailController.text, _passwordController.text);
      },
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.orangeColor),
        ),
        labelText: "Enter Password",
        labelStyle: TextStyle(color: CustomColors.orangeColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Align signUpButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.1),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot password?",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Row rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: Colors.black,
          value: true,
          onChanged: (value) {},
        ),
        Text(
          "Remember Me",
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Center loginButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.orangeColor,
          fixedSize: Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () async {
          if (_emailController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty) {
            UserModel? user = await _loginService.login(
                _emailController.text, _passwordController.text);
            if (user != null) {
              await _saveUserCredentials();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => BottomBar(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('email or password incorrect'),
                ),
              );
              return null;
            }
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Text orText() {
    return const Text(
      " ________________ OR ________________",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Text signUsingText() {
    return const Text(
      "Sign in using:",
      style: TextStyle(fontWeight: FontWeight.w600),
    );
  }

  Column socialMediaButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton.mini(
              onPressed: () {},
              buttonType: ButtonType.google,
            ),
            SignInButton.mini(
              onPressed: () {},
              buttonType: ButtonType.facebook,
            ),
            SignInButton.mini(
              onPressed: () {},
              buttonType: ButtonType.twitterX,
            ),
          ],
        ),
      ],
    );
  }

  topImageContainer(String image) {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        image,
        height: 200,
      ),
    );
  }

  InputDecoration customInputDecoration() {
    return const InputDecoration(
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
