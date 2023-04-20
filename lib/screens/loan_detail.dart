// ignore_for_file: camel_case_types, unnecessary_const, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoanDetail extends StatefulWidget {
  @override
  State<LoanDetail> createState() => _LoanDetailState();
}

class _LoanDetailState extends State<LoanDetail> {
  bool? trackno = false;
  double loanAmount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const Text(
                'Loan Detail !',
              ).text.bold.black.make(),
              backgroundColor: Colors.lightGreen,
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
                child: SingleChildScrollView(
              child: SizedBox(
                height: 1000,
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
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 480,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select your Loan Amount',
                                      ).text.size(16).bold.make().pOnly(top: 30),

                                      // TextFormField(
                                      //   decoration: InputDecoration(
                                      //     hintText: '300',
                                      //     suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                      //     border: OutlineInputBorder(),
                                      //   ),
                                      //   onChanged: (value) {
                                      //     setState(() {
                                      //       loanAmount = double.parse(value);
                                      //     });
                                      //   },
                                      // ).py12(),

                                      DropdownButtonFormField(

                                        decoration: InputDecoration(
                                          hintText: 'Select Amount',
                                          border: OutlineInputBorder(),

                                        ),
                                        items: [

                                          DropdownMenuItem(
                                            value: '3000',
                                            child: Text('3000'),
                                          ),
                                          DropdownMenuItem(
                                            value: '5000',
                                            child: Text('5000'),
                                          ),
                                          DropdownMenuItem(
                                            value: '6000',
                                            child: Text('6000'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            loanAmount = double.parse(value!);
                                          });
                                        },

                                      ),

                                      SizedBox(height: 15,),

                                      Text(
                                        'Loan Details',
                                      ).text.size(16).bold.make(),
                                      SizedBox(height: 15,),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          children: [

                                            // Row(
                                            //
                                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            //   children: [
                                            //
                                            //     buildRow('Loan amount')
                                            //         .px12()
                                            //         .py8(),
                                            //     Text("${loanAmount}"),
                                            //   ],
                                            // ),
                                            buildRow('Terms').px12().py8(),
                                            buildRow('GST').px12().py8(),
                                            buildRow('Service fee(+GST)')
                                                .px12()
                                                .py8(),
                                            buildRow('Interest').px12().py8(),

                                            buildRow('Daily Overdue fee')
                                                .px12()
                                                .py8(),
                                            buildRow('Received amount')
                                                .px12()
                                                .py8(),
                                            buildRow('Repayment amount')
                                                .px12()
                                                .py8(),
                                          ],
                                        ),
                                      ).py16()
                                    ],
                                  ),
                                ),
                                Text('Confirm Your Bank Account')
                                    .text
                                    .size(15)
                                    .bold
                                    .make()
                                    .py12(),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'EasyPaisa   ********5222',
                                      suffixIcon:
                                          Icon(Icons.arrow_drop_down_sharp),
                                      border: OutlineInputBorder()),
                                ).py12(),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF76FF03),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: 'Apply Now'
                                            .text
                                            .black
                                            .bold
                                            .size(15)
                                            .make()),
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
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ))));
  }

  Row buildRow(String title) {
    double interest = loanAmount * 0.0;
    double gst = loanAmount * 0.05;
    double terms = loanAmount * 0.05;
    double serviceFee = loanAmount * 0.05;
    double receivedAmount = loanAmount - gst - serviceFee - terms;
    double dailyOverdueFee = loanAmount * 0.01;
    double repaymentAmount = loanAmount + interest + serviceFee + dailyOverdueFee;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
      //  Text('Rs: ${loanAmount.toString()}'),
        if (title == 'Interest') Text('Rs: ${interest.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'GST') Text('Rs: ${gst.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Terms') Text('Rs: ${terms.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Service fee(+GST)') Text('Rs: ${serviceFee.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Received amount') Text('Rs: ${receivedAmount.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Daily Overdue fee') Text('Rs: ${dailyOverdueFee.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Repayment amount') Text('Rs: ${repaymentAmount.toDoubleStringAsFixed(digit: 2)}'),
      ],
    );
  }
}
