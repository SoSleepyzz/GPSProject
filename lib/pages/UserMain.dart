import 'dart:developer';
import 'package:final_project/config/config.dart';
import 'package:final_project/models/res/sendListRes.dart';
import 'package:final_project/models/res/userAllRes.dart'; // Ensure this model is defined
import 'package:final_project/models/res/riderAllRes.dart'; // Ensure this model is defined
import 'package:final_project/pages/ProfilePage.dart';
import 'package:final_project/pages/RecievePage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;

class Usermain extends StatefulWidget {
  const Usermain({super.key});

  @override
  State<Usermain> createState() => _UsermainState();
}

class _UsermainState extends State<Usermain> {
  List<SendListResDart> sendlist = [];
  List<String> recipientNames = [];
  List<String> riderNames = [];
  int _currentIndex = 0;
  final gs = GetStorage();
  var uid;
  String url = "";

  @override
  void initState() {
    super.initState();
    uid = gs.read('uid');
    Configuration config = Configuration();

    // Get the configuration first
    config.getConfig().then((value) {
      log(value['apiEndpoint']);
      url = value['apiEndpoint'];

      // Perform the HTTP GET request after the URL is obtained
      return http.get(Uri.parse('$url/send/$uid'));
    }).then((response) {
      // Check the response status and parse it
      if (response.statusCode == 200) {
        // Parse the response body
        List<SendListResDart> fetchedSendlist = sendListResDartFromJson(response.body);

        // Fetch recipient and rider names
        fetchRecipientAndRiderNames(fetchedSendlist).then((_) {
          setState(() {
            sendlist = fetchedSendlist; // Update your state variable
          });

          // Log the fetched data
          log(sendlist.toString());
        });
      } else {
        // Handle error responses
        log('Error: ${response.statusCode}');
      }
    }).catchError((err) {
      log('Error: $err');
    });
  }

  Future<void> fetchRecipientAndRiderNames(List<SendListResDart> fetchedSendlist) async {
    for (var item in fetchedSendlist) {
      log(item.rId.toString());
      log(item.riId.toString());

      // Fetch recipient name
      var userResponse = await http.get(Uri.parse('$url/user/name/${item.rId}'));
      if (userResponse.statusCode == 200) {
        var users = userAllResDartFromJson(userResponse.body); // Parse response to List<UserAllResDart>
        if (users.isNotEmpty) {
          var user = users.first; // Get the first user
          recipientNames.add('${user.fname} ${user.lname}'); // Access fname and lname
        } else {
          recipientNames.add('Unknown Recipient'); // Handle case when no users are returned
        }
      } else {
        recipientNames.add('Unknown Recipient'); // Handle error if needed
      }

      // Fetch rider name
      var riderResponse = await http.get(Uri.parse('$url/rider/name/${item.riId}'));
      if (riderResponse.statusCode == 200) {
        var riders = riderAllResDartFromJson(riderResponse.body); // Parse response to List<RiderAllResDart>
        if (riders.isNotEmpty) {
          var rider = riders.first; // Get the first rider
          riderNames.add('${rider.fname} ${rider.lname}'); // Access fname and lname
        } else {
          riderNames.add('Unknown Rider'); // Handle case when no riders are returned
        }
      } else {
        riderNames.add('Unknown Rider'); // Handle error if needed
      }
    }
  }

  String getStatusMessage(int status) {
    switch (status) {
      case 0:
        return "รอ Rider";
      case 1:
        return "Rider กำลังไปรับของ";
      case 2:
        return "Rider กำลังไปส่ง";
      case 3:
        return "ส่งของเสร็จสิ้น";
      default:
        return "สถานะไม่ทราบ"; // Default message for unknown status
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FilledButton(
                onPressed: () {
                  // Add functionality here if needed
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF00C92C), // Background color
                  minimumSize: const Size(250, 60), // Minimum size
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
                ),
                child: const Text(
                  "Send",
                  style: TextStyle(
                    color: Colors.black, // Text color
                    fontSize: 22, // Font size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: 330,
                  height: 1,
                  child: Container(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('Sending Lists', style: TextStyle(fontSize: 20)),
              ),
              // Displaying the fetched sendlist
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: sendlist.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: sendlist.length,
                        itemBuilder: (context, index) {
                          final item = sendlist[index];
                          return Card(
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
                                    'ชื่อผู้รับ : ${recipientNames.isNotEmpty ? recipientNames[index] : 'Loading...'}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'สถานะส่งของ : ${getStatusMessage(item.status)}', // Use the new status message method
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'ชื่อ Rider : ${riderNames.isNotEmpty ? riderNames[index] : 'Loading...'}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 15),
                                  Center(
                                    child: FilledButton(
                                      onPressed: () {
                                        // Add functionality for view details here
                                      },
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
                          );
                        },
                      )
                    : Text('No sending items available.'), // Handle empty state
              ),
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
            onTabChange: _onTabChange,
            padding: const EdgeInsets.all(15.0),
            selectedIndex: _currentIndex,
            tabs: const [
              GButton(icon: Icons.home, text: 'Send'),
              GButton(icon: Icons.local_shipping, text: 'Recieve'),
              GButton(icon: Icons.account_circle, text: 'Profile'),
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
