import 'dart:convert';
import 'dart:developer';

import 'package:final_project/config/config.dart';
import 'package:final_project/models/req/userLoginReq.dart';
import 'package:final_project/models/res/userLoginRes.dart';
import 'package:final_project/pages/RegChoose.dart';
import 'package:final_project/pages/RiderMain.dart';
import 'package:final_project/pages/UserMain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController userNameCtl = TextEditingController();
  TextEditingController passWordCtl = TextEditingController();
  final gs = GetStorage();
  var uid;
  String url = "";
  String text = "";

  void initState() {
      super.initState();
      uid = gs.read('uid');
      // if(uid){
      //   Get.to((Route)=>HomePage());
      // };
      Configuration config = Configuration();
      config.getConfig().then(
        (value) {
          log(value['apiEndpoint']);
          url = (value['apiEndpoint']);
        },
      ).catchError((err) {
        log(err.toString());
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset('assets/images/Logo.png',
                width: 256,
                height: 230,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Username'),
                    ),
                    TextField(
                      controller: userNameCtl,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        fillColor: Color(0xFF767676)
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text("Password"),
                    ),
                    TextField(
                        controller: passWordCtl,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          fillColor: Color(0xFF767676)
                        ),
                      )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: FilledButton(
                    onPressed: () => login(),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF00C92C), // กำหนดสีพื้นหลังของปุ่มเป็นสีเหลือง
                      minimumSize: const Size(250, 60), // กำหนดขนาดขั้นต่ำ
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15), // เพิ่ม padding ภายในปุ่ม
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors
                            .black, // เปลี่ยนสีข้อความเป็นสีดำเพื่อให้เห็นชัดบนพื้นหลังสีเหลือง
                        fontSize: 22, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ทำให้ตัวอักษรหนาขึ้น
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: Color(0xFF00C92C)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: TextButton(
                    onPressed: () => register(),
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                              text: " Register!",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFF00C92C))),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
   void login() {
    var data = UserLoginReqDart(phone: userNameCtl.text, password: passWordCtl.text);    
        http.post(Uri.parse('$url/test/login'),
            headers: {"Content-Type": "application/json; charset=utf-8"},
            body: jsonEncode(data))
        .then(
      (value) {
        log(value.body);
        UserLoginResDart user = userLoginResDartFromJson(value.body);
        gs.write("uid", user.id);
        log("user.Id");
        if (user.type == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Usermain(),
                // ส่ง UID ไปตอนนี้ยังไม่มีตัวรับ UID ในหน้า HomePage เลย comment ไว้ก่อน
                // builder: (context) => HomePage(UID: user.uid),
              ));
        } else if (user.type == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Ridermain(),
              ));
        }
      },
    ).catchError((eee) {
      setState(() {
        text = 'name or password incorrect!';
      });
      log(eee.toString());
    });
  }

  register(){
     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Regchoose(),
              ));
  }
}