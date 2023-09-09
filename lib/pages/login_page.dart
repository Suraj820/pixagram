import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double _deviceHeight = 0;
  double _deviceWidth = 0;
  late TextEditingController _userController;
  late TextEditingController _passController;
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Form(
        key: _formKey,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: _deviceHeight,
                width: _deviceWidth,
                padding: EdgeInsets.only(top: _deviceHeight! * 0.02),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _showLanguage(),
                          _showLogo(),
                          _userInput(),
                          _passwordInput(),
                          _submitButton(),
                          _forgottenPassword(),
                        ],
                      ),
                    ),
                    _createNewAccount(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _showLanguage() {
    return const Text(
      "English(India)",
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
  }

  Widget _showLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: _deviceHeight! * 0.2,
      width: _deviceWidth! * 0.2,
      child: SvgPicture.asset("assets/logo/Instagram.svg"),
    );
  }

  Widget _userInput() {
    return Container(
      height: _deviceHeight! * 0.1,
      margin: EdgeInsets.only(
          left: _deviceWidth! * 0.05,
          right: _deviceWidth! * 0.05,
          top: _deviceHeight! * 0.05),
      child: TextFormField(
        controller: _userController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "User name"),
        keyboardType: TextInputType.text,
        validator: (_value){
          if(_value == null || _value.isEmpty){
            return "Please enter your username";
          }
          return null;
        },
      ),
    );
  }

  Widget _passwordInput() {
    return Container(
      height: _deviceHeight! * 0.1,
      margin: EdgeInsets.only(
          left: _deviceWidth! * 0.05,
          right: _deviceWidth! * 0.05,
          top: _deviceHeight! * 0.03),
      child: TextFormField(
        obscureText: _isHidden,
        controller: _passController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Password",
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
              icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
        ),
        keyboardType: TextInputType.visiblePassword,
          validator: (_value){
            if(_value == null || _value.isEmpty){
              return "Please enter your username";
            }
            return null;
          }
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.only(
          left: _deviceWidth! * 0.05,
          right: _deviceWidth! * 0.05,
          top: _deviceHeight! * 0.03),
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _forgottenPassword() {
    return Container(
      margin: EdgeInsets.only(top: _deviceHeight!*0.02),
      child: GestureDetector(
        onTap: (){

        },
        child: const Text(
          "Forgotten Password?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget _createNewAccount() {
    return Container(
      margin: EdgeInsets.only(
          left: _deviceWidth! * 0.05,
          right: _deviceWidth! * 0.05,
          bottom: _deviceHeight! * 0.03),
      width: _deviceWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.blue)
      ),
      child: MaterialButton(
        onPressed: () {
          _createAccount();
        },
        child: const Text(
          "Create new account",
          style: TextStyle(
              color: Colors.blue
          ),
        ),
      ),
    );
  }

  void _createAccount() {
    Navigator.pushNamed(context, 'registration');
  }
}
