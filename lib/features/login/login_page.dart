// lib/features/login/login_page.dart
import 'package:cobalagi/features/sign_up/sign_up_page.dart';
import 'package:cobalagi/features/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text("Malang, Indonesia"),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Let's Sign You In",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 32),
            // Username or Email field
            TextField(
              decoration: InputDecoration(
                labelText: 'Username or Email',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Password field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            // Sign in button
            ElevatedButton(
              onPressed: () {
                // Navigate to store page after login
                Get.to(StorePage());
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFD3A335), // Gold Color
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SIGN IN"),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Sign up text
            TextButton(
              onPressed: () {
                // Navigate to Sign Up Page
                Get.to(SignUpPage());
              },
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Facebook connect button
            ElevatedButton.icon(
              onPressed: () {
                // Add Facebook login action here
              },
              icon: Icon(Icons.facebook),
              label: Text("Connect with Facebook"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Facebook blue color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}