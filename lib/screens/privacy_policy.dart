import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Privacy{
    void showMyDialog(BuildContext context)async{
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return  AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Permissions').text.bold.make().centered(),
            content: Container(
              height: 350,
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    "Dear Customer.\n".text.size(13).make(),
                    Text( "Please read the following and confirm our").text.size(13).make(),
                    Text('"Privacy Policy" and "Terms & Conditions"').text.size(13).make(),
                    Text("by clicking the 'Agree' button").text.size(13).make(),
                    SizedBox(height: 15),
                    Text('To assess your eligibility and facilitate faster disbursal of your loan, we need permission to access your location, SMS, Camera, and installed Application').text.size(13).make(),
                    SizedBox(height: 15),
                    Text('In order to evaluate your quilifications and speed up the review, we will collect the following information:').text.size(13).make(),
                    Text('1) Pesonal information: name, phone number, email, etc.').text.size(13).make(),
                    Text('2) Location data').text.size(13).make(),
                    Text('3) CNIC photo').text.size(13).make(),
                    Text('4) Bank card or mobile wallet account number').text.size(13).make(),
                    Text('5) Emergency Contact given by the user').text.size(13).make(),
                    Text('6) SMS').text.size(13).make(),
                    Text('7) Application inatalled on your device').text.size(13).make(),
                    Text('8) Device identifier and other informatio. All data will be uploaded in encrypted form through the'
                        'interface and stored on our server, but Barwaqt will not pass it to third parties without authorization').text.size(13).make(),
                    Text('Lorem ipsum is a name for a common type of placeholder text.'
                        ' Also known as filler or dummy text, this is text copy that serves to fill a space without saying anything meaningful.'
                        ' It is essentially nonsense text that still gives an idea of what real words will look like the  product').text.size(13).make()
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              InkWell(
                onTap: (){},
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF76FF03),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: 'Agree'.text.make() ),
                ),
              ).pOnly(bottom: 15,left: 15,right: 15),
            ],

          );
        },
      );
    }
}

