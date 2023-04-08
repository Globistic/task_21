import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/registration_screen.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Your Name',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Please enter your first name and last name',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Neumorphic(
                    margin: const EdgeInsets.only(right: 10),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.5, horizontal: 10),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Neumorphic(
                    margin: const EdgeInsets.only(left: 10),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.5, horizontal: 10),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            NeumorphicButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
