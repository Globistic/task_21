import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:task_21/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsScreen extends StatefulWidget {
  @override
  _EmergencyContactsScreenState createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<Contact> _contacts = [];
  List<Contact> _selectedContacts = [];
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    // _fetchContacts();
  }

  _openContacts() async {
    final uri = 'content://contacts/people/';
    await LaunchUrl().launchUri(uri);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  LinearProgressIndicator(
                    value: 0.9, // 10% as decimal value
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  Positioned(
                    top: 2,
                    bottom: 2,
                    left: 2,
                    right: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '10%',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Select two emergency contacts',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Family Member',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: NeumorphicButton(
                    onPressed: () {
                      _openContacts();
                    },
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(1),
                      ),
                      depth: 1,
                    ),
                    child: Center(
                      child: Text(
                        'Select Contacts ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
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
                        hintText: 'Relation Ship',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 5,
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
                        hintText: 'Member Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Friend Number ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: NeumorphicButton(
                    onPressed: () {
                      _openContacts();
                    },
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(1),
                      ),
                      depth: 1,
                    ),
                    child: Center(
                      child: Text(
                        'Select From Contacts List',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 5,
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
                        hintText: 'Friend Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = _contacts[index];
                  return NeumorphicButton(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    style: NeumorphicStyle(
                      depth: 3,
                      color: _selectedContacts.contains(contact)
                          ? Colors.blue
                          : Colors.white,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_selectedContacts.contains(contact)) {
                          _selectedContacts.remove(contact);
                        } else {
                          _selectedContacts.add(contact);
                        }
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${contact.displayName}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: NeumorphicTheme.defaultTextColor(context),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "${contact.phones!.isNotEmpty ? contact.phones!.first.value : 'No phone number'}",
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    NeumorphicTheme.defaultTextColor(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            NeumorphicButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(30),
                ),
                depth: 1,
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class LaunchUrl {
  Future<void> launchUri(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'NOT_LUNCH_URI $uri';
    }
  }
}
