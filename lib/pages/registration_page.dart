
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _RegistrationPageState();
  }

}
class _RegistrationPageState extends State<RegistrationPage>{
  double _deviceHeight = 0;
  double _deviceWidth = 0;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String? _name ,_email,_password;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth*0.05,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(),
              _registrationForm(),
              _registerButton()
            ],

          ),
        ),
      ),),
    );
  }
  Widget _titleWidget(){
    return Text("Pixagram",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),);
    
  }
  Widget _registerButton(){
    return MaterialButton(onPressed: (){},
      minWidth: _deviceWidth*0.50,
      height: _deviceHeight*0.05,
      color: Colors.blue,
      child: const Text("Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
  Widget _registrationForm(){
    return Container(
      height: _deviceHeight * 0.30,
      child:  Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
          ],

        ),
      ),

    );
  }
  Widget _nameTextField(){
    return TextFormField(
      decoration: const InputDecoration(hintText: "Name"),
      validator: (_value) => _value!.isNotEmpty ? null:"Please enter name",
      onSaved: (_value){
        setState(() {
          _name = _value;
        });
      },
    );
  }

}