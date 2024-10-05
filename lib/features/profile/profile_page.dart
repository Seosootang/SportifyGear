// profile_page.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _saveImagePath(pickedFile.path);
      } else {
        _image = null;
      }
    });
  }

  Future<void> _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  Future<void> _loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null) {
      setState(() {
        _image = File(path);
      });
    }
  }

  Future<void> _deleteImage() async {
    setState(() {
      _image = null;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image_path');
  }

  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture and edit/select image buttons
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final pickedFile = await _picker.getImage(source: ImageSource.camera);
                          setState(() {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                              _saveImagePath(pickedFile.path);
                            } else {
                              _image = null;
                            }
                          });
                        },
                        child: Text('Take Photo'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _selectImage,
                        child: Text('Select Image'),
                      ),
                      SizedBox(width: 16),
                      _image != null
                        ? ElevatedButton(
                            onPressed: _deleteImage,
                            child: Text('Delete'),
                            style: ElevatedButton.styleFrom(primary: Colors.red),
                          )
                        : Container(), // or SizedBox.shrink() to take up no space
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Profile information with borders
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: ${Get.arguments['username']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Email: ${Get.arguments['email']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Phone Number: ${Get.arguments['phoneNumber']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Favorite Sport: ${Get.arguments['favoriteSport']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Alamat: ${Get.arguments['location']}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}