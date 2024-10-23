import 'package:final_project/pages/DetailPage.dart';
import 'package:final_project/pages/LoginPage.dart';
import 'package:final_project/pages/RegChoose.dart';
import 'package:final_project/pages/RegisterPage.dart';
import 'package:final_project/pages/RiderMain.dart';
import 'package:final_project/pages/RiderReg.dart';
import 'package:final_project/pages/SendForm.dart';
import 'package:final_project/pages/UserMain.dart';
import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
          } , child: Text('Login page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Regchoose()));
          } , child: Text('Register page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RiderRegPage()));
          } , child: Text('Rider reg page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegPage()));
          } , child: Text('User reg page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Usermain()));
          } , child: Text('User Main page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SendForm()));
          } , child: Text('Sending Detail page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
          } , child: Text('Detail page') ),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Ridermain()));
          } , child: Text('Rider Main page') ),
        ],
      ),
    );
  }
}