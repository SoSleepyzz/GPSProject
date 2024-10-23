import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController userNameCtl = TextEditingController();
  TextEditingController passWordCtl = TextEditingController();
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
  login(){

  }
  register(){

  }
}