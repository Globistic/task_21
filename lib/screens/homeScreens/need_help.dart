import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NeedHelpScreen extends StatelessWidget {
  const NeedHelpScreen({Key? key}) : super(key: key);

  final String phoneNumber = '1234567890';
  final String whatsappNumber = '0987654321';
  final String smsNumber = '1112223333';
  final String facebookUrl = 'https://www.facebook.com/mycompany';
  final String twitterUrl = 'https://www.twitter.com/mycompany';
  final String instagramUrl = 'https://www.instagram.com/mycompany';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Column(
        children: [

          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => launch('tel:$phoneNumber'),
            icon: Icon(Icons.phone),
            label: Text('Call'),
          ),
          ElevatedButton.icon(
            onPressed: () => launch('https://wa.me/$whatsappNumber'),
            icon: Icon(Icons.chat),
            label: Text('WhatsApp'),
          ),
          ElevatedButton.icon(
            onPressed: () => launch('sms:$smsNumber'),
            icon: Icon(Icons.message),
            label: Text('SMS'),
          ),
          SizedBox(height: 32),
          Text(
            'Follow Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => launch(facebookUrl),
                icon:FaIcon(FontAwesomeIcons.facebook),
              ),
              IconButton(
                onPressed: () => launch(twitterUrl),
                icon: FaIcon(FontAwesomeIcons.twitter),
              ),
              IconButton(
                onPressed: () => launch(instagramUrl),
                icon: FaIcon(FontAwesomeIcons.instagram),
              ),
            ],
          ),
        ],
      ),
    );
  }
}