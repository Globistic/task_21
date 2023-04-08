
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class Main_Profile extends StatefulWidget {
  const Main_Profile({super.key});

  @override
  State<Main_Profile> createState() => _Main_ProfileState();
}

class _Main_ProfileState extends State<Main_Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(child: Column(children: [
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Image.asset('image/user.png'),),
            title: Text('NOOR UL AKBAR'),
            subtitle: Text('03******2423'),
            trailing: Icon(Icons.notifications),
          ),
        ).px4().py16(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(children: [
            ListTile(
              onTap: (){
                      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Call Method '),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
   FloatingActionButton(onPressed: (){},child: Icon(Icons.call),),
   
   FloatingActionButton(onPressed: (){},child: Icon(Icons.call),backgroundColor: Color(0xFF76FF03),),
                
                ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
              },
            leading: Image.asset('image/customer.jpg',height: 30,width: 30,),
            title: Text('Customer Service/Need Help'),
            trailing: Icon(Icons.arrow_forward_ios)
            ).py(6),
             ListTile(
              
            leading: Icon(Icons.person_outline_outlined),
            title: Text('About Order Status '),
            trailing: Icon(Icons.arrow_forward_ios)
            ).py(6),
             ListTile(
              onTap: (){
               // Get.to(History_Screen());
              },
            leading: Icon(Icons.history),
            title: Text('History'),
            trailing: Icon(Icons.arrow_forward_ios)
            ).py(6),
             ListTile(
              
              onTap: (){
               // Get.to(About_Us_Screen());
              },
            leading: Icon(Icons.person),
            title: Text('About us'),
            trailing: Icon(Icons.arrow_forward_ios)
            ).py(6)
          ],),
        ).py32()
      ],),),
    ) );
  }
}