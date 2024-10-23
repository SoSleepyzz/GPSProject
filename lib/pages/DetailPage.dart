import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Map Section
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'แผนที่',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Delivery Details
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ชื่อ Rider : wwwww'),
                ),
                const SizedBox(height: 5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ชื่อผู้ส่ง : aaaaaaaaaa'),
                ),
                const SizedBox(height: 5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('สถานะ : กำลังจัดส่ง'),
                ),
                const SizedBox(height: 10),

                // Details Field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('รายละเอียด :'),
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFD3D3D3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Image Section
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'รูปของ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'รูป',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Back Button
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF00C92C),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'กลับ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
