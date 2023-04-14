// ignore_for_file: camel_case_types, unnecessary_const, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Loan_detail extends StatefulWidget {



  @override
  State<Loan_detail> createState() => _Loan_detailState();
}

class _Loan_detailState extends State<Loan_detail> {

  bool? trackno = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              'Loan Detail',
            ).text.bold.black.make(),
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            elevation: 0,

          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Colors.lightGreen,
                        width: double.infinity,
                        height: 250,
                      ),
                      Positioned(
                        top: 100,
                        left: 20,
                        right: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(
                                color: Colors.black12
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          height: 450,
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select your Loan Amount',
                              ).text.size(16).bold.make().pOnly(top: 30),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: '300',
                                    suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                    border: OutlineInputBorder()),
                              ).py12(),
                              Text(
                                'Loan Details',
                              ).text.size(16).bold.make(),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black26
                                    ),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                child: Column(
                                  children: [
                                    buildRow('Loan amount').px12().py8(),
                                    buildRow('Terms').px12().py8(),
                                    buildRow('GST').px12().py8(),
                                    buildRow('Service fee(+GST)').px12().py8(),
                                    buildRow('Interest').px12().py8(),
                                    buildRow('Received amount').px12().py8(),
                                    buildRow('Daily Overdue fee').px12().py8(),
                                    buildRow('Repayment amount').px12().py8(),
                                  ],
                                ),
                              ).py16()
                            ],
                          ),
                        ),
                          Text('Confirm Your Bank Account').text.size(15).bold.make().py12(),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'EasyPaisa   ********5222',
                                  suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                  border: OutlineInputBorder()),
                            ).py12(),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF76FF03),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(child: 'Apply Now'.text.black.bold.size(15).make() ),
                              ),
                            ).pOnly(top: 10),
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //       value: trackno,
                    //    onChanged: (value){
                    //     setState(() {
                    //       trackno = value;
                    //     });
                    //    },
                    //     ),
                    //     'I have read and agree to'.text.size(5).make(),
                    //
                    //     'Loan Agreement Privacy'.text.size(5).bold.blue900.make()
                    //   ],
                    // ),

                          ],)

                      ),
                    ],

                  ),
                ],
              ),
            ),
          )),
    );
  }

  Row buildRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text('Rs: 0000')],
    );
  }
}
