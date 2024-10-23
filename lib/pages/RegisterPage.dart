import 'package:flutter/material.dart';

class UserRegPage extends StatefulWidget {
  const UserRegPage({super.key});

  @override
  State<UserRegPage> createState() => _UserRegPageState();
}

class _UserRegPageState extends State<UserRegPage> {
  final TextEditingController firstNameCtl = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController userNameCtl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  void register() {
    print("Register button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "User Register",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF00C92C),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text("Enter Your information"),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("First name :"),
                ),
                TextField(
                  controller: firstNameCtl,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20),
                  child: Text("Last name :"),
                ),
                TextField(
                  controller: lastName,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text("Phone :"),
                ),
                TextField(
                  controller: phoneNo,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 20, top: 20),
                //   child: Text("Email :"),
                // ),
                // TextField(
                //   controller: emailCtl,
                //   keyboardType: TextInputType.text,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(30)),
                //     ),
                //     filled: true,
                //     fillColor: Color(0xFFD0CCCC),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text("Username :"),
                ),
                TextField(
                  controller: userNameCtl,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text("Password :"),
                ),
                TextField(
                  controller: passwordCtl,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text("Confirm Password :"),
                ),
                TextField(
                  controller: confirmPass,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text("Address :"),
                ),
                TextField(
                  controller: emailCtl,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Color(0xFFD0CCCC),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: FilledButton(
                    onPressed: register,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff00c92c),
                      foregroundColor: Colors.black,
                      fixedSize: const Size(200, 50),
                    ),
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
