import 'package:flutter/material.dart';

class Ridermain extends StatefulWidget {
  const Ridermain({super.key});

  @override
  State<Ridermain> createState() => _RidermainState();
}

class _RidermainState extends State<Ridermain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Card(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}