import 'package:final_project/pages/ProfilePage.dart';
import 'package:final_project/pages/RecievePage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Usermain extends StatefulWidget {
  const Usermain({super.key});

  @override
  State<Usermain> createState() => _UsermainState();
}

class _UsermainState extends State<Usermain> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [ FilledButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegPage()));
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
                      "Send",
                      style: TextStyle(
                        color: Colors
                            .black, // เปลี่ยนสีข้อความเป็นสีดำเพื่อให้เห็นชัดบนพื้นหลังสีเหลือง
                        fontSize: 22, // ขนาดตัวอักษร
                        fontWeight: FontWeight.bold, // ทำให้ตัวอักษรหนาขึ้น
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, ),
                child: SizedBox(
                  width: 330,
                  height: 1,
                  child: Container(
                    color : Colors.black
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('Sending Lists', style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ชื่อผู้รับ : aaaaaaaaaa',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'สถานะส่งของ : กำลังจัดส่ง',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'ชื่อ Rider : wwwww',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: FilledButton(
                            onPressed: null, // Add functionality here
                            style: FilledButton.styleFrom(
                              backgroundColor: Color(0xFF00C92C),
                              minimumSize: Size(200, 50),
                            ),
                            child: Text(
                              'ดูรายละเอียด',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 164, 152, 112),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: GNav(
              backgroundColor: const Color.fromARGB(255, 164, 152, 112),
              color: const Color.fromARGB(255, 255, 255, 255),
              activeColor: const Color.fromARGB(255, 255, 255, 255),
              tabBackgroundColor: const Color.fromARGB(255, 107, 79, 24),
              gap: 5,
              onTabChange:
                  _onTabChange, // ใช้ฟังก์ชัน _onTabChange เพื่ออัปเดตสถานะ
              padding: const EdgeInsets.all(15.0),
              selectedIndex: _currentIndex, // ใช้ดัชนีที่เลือก
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Send',
                ),
                GButton(
                  icon: Icons.local_shipping,
                  text: 'Recieve',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
    );
  }
  void _onTabChange(int index) {
  setState(() {
    _currentIndex = index;
  });

  switch (index) {
    case 0:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Usermain()),
      );
      break;
    case 1:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RecievePage()),
      );
      break;
    case 2:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profilepage()),
      );
      break;
  }
}

}