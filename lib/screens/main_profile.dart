
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(child: Column(children: [
        Card(
          child: ListTile(
           // leading: CircleAvatar(child: Image.asset('image/user.png'),),
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
            FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').get(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['name']),
                        subtitle: Text(data['phoneNo']),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error fetching data');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
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
         //   leading: Image.asset('image/customer.jpg',height: 30,width: 30,),
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