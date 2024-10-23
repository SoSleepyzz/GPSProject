import 'package:final_project/pages/RegisterPage.dart';
import 'package:final_project/pages/RiderReg.dart';
import 'package:flutter/material.dart';

class Regchoose extends StatefulWidget {
  const Regchoose({super.key});

  @override
  State<Regchoose> createState() => _RegchooseState();
}

class _RegchooseState extends State<Regchoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             FilledButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegPage()));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF00C92C), // กำหนดสีพื้นหลังของปุ่มเป็นสีเหลือง
                      minimumSize: const Size(250, 60), // กำหนดขนาดขั้นต่ำ
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15), // เพิ่ม padding ภายในปุ่ม
                    ),
                    child: const Text(
                      "Register as User",
                      style: TextStyle(
                        color: Colors
                            .black, // เปลี่ยนสีข้อความเป็นสีดำเพื่อให้เห็นชัดบนพื้นหลังสีเหลือง
                        fontSize: 22, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ทำให้ตัวอักษรหนาขึ้น
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RiderRegPage()));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF00C92C), // กำหนดสีพื้นหลังของปุ่มเป็นสีเหลือง
                      minimumSize: const Size(250, 60), // กำหนดขนาดขั้นต่ำ
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15), // เพิ่ม padding ภายในปุ่ม
                    ),
                    child: const Text(
                      "Register as Rider",
                      style: TextStyle(
                        color: Colors
                            .black, // เปลี่ยนสีข้อความเป็นสีดำเพื่อให้เห็นชัดบนพื้นหลังสีเหลือง
                        fontSize: 22, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ทำให้ตัวอักษรหนาขึ้น
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}