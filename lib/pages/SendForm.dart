import 'dart:io'; // For working with File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import the image picker

class SendForm extends StatefulWidget {
  const SendForm({super.key});

  @override
  State<SendForm> createState() => _SendFormState();
}

class _SendFormState extends State<SendForm> {
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  File? _image; // Variable to store the selected image
  final ImagePicker _picker = ImagePicker(); // Initialize the picker

  // Function to pick an image from the camera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Camera and Gallery Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Camera Button
                    GestureDetector(
                      onTap: _pickImageFromCamera,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C92C),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Spacing between buttons

                    // Gallery Button
                    GestureDetector(
                      onTap: _pickImageFromGallery,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C92C),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.photo_library,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Display the selected image or a placeholder
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover)
                      : const Center(
                          child: Text('รูป', style: TextStyle(fontSize: 20)),
                        ),
                ),
                const SizedBox(height: 20),

                // Recipient Field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ผู้รับ(เบอร์โทร) :'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: recipientController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFD3D3D3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Details Field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('รายละเอียด :'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: detailsController,
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

                // Send Button
                FilledButton(
                  onPressed: () {
                    // Add your send functionality here
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF00C92C),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Send',
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
