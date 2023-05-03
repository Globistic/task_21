// ignore_for_file: camel_case_types, unnecessary_const, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoanDetail extends StatefulWidget {
  final userId;
  final name;

  const LoanDetail({Key? key, required this.userId, required this.name})
      : super(key: key);

  @override
  State<LoanDetail> createState() => _LoanDetailState();
}

class _LoanDetailState extends State<LoanDetail> {
  bool? trackno = false;
  double loanAmount = 0;
  String? _selectedPaymentMethod;

  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Loan Detail',
          ).text.bold.black.make(),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [

              //     Padding(
              //       padding: EdgeInsets.all(20),
              //       child: Text('Confirm Your Bank Account'),
              //     ),
              //     SizedBox(
              //       height: 50,
              //       child: DropdownButton<String>(
              //         value: _selectedPaymentMethod,
              //         onChanged: (String? newValue) {
              //           setState(() {
              //             _selectedPaymentMethod = newValue!;
              //           });
              //         },
              //         items: <String>['EasyPaisa', 'JazzCash']
              //             .map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //     TextFormField(
              //       decoration: InputDecoration(
              //           hintText: 'EasyPaisa   ********5222',
              //           suffixIcon:
              //               Icon(Icons.arrow_drop_down_sharp),
              //           border: OutlineInputBorder()),
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         height: 40,
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           color: Color(0xFF76FF03),
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //         child: Center(
              //             child: 'Apply Now'
              //                 .text
              //                 .black
              //                 .bold
              //                 .size(15)
              //                 .make()),
              //       ),
              //     ).pOnly(top: 10),
              //     Row(
              //       children: [
              //         Checkbox(
              //           value: trackno,
              //        onChanged: (value){
              //         setState(() {
              //           trackno = value;
              //         });
              //        },
              //         ),
              //         'I have read and agree to'.text.size(5).make(),
              //
              //         'Loan Agreement Privacy'.text.size(5).bold.blue900.make()
              //       ],
              //     ),
              //   ],
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 480,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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

                          SizedBox(
                            height: 15,
                          ),

                          Text(
                            'Loan Details',
                          ).text.size(16).bold.make(),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
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
                                buildRow('Service fee(+GST)').px12().py8(),
                                buildRow('Interest').px12().py8(),

                                buildRow('Daily Overdue fee').px12().py8(),
                                buildRow('Received amount').px12().py8(),
                                buildRow('Repayment amount').px12().py8(),
                              ],
                            ),
                          ).py16()
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Confirm Your Bank Account'),
                    ),
                    SizedBox(
                      height: 50,
                      child: DropdownButtonFormField<String>(
                        value: _selectedPaymentMethod,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPaymentMethod = newValue!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        items: <String>['EasyPaisa', 'JazzCash']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a payment method';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Enter 11-digit phone number',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        if (value.length != 11) {
                          return 'Phone number must be 11 digits long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedPaymentMethod = 'EasyPaisa';
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: _selectedPaymentMethod == 'EasyPaisa'
                                    ? Colors.green
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: 'EasyPaisa'
                                    .text
                                    .color(_selectedPaymentMethod == 'EasyPaisa'
                                        ? Colors.black
                                        : Colors.grey)
                                    .bold
                                    .size(15)
                                    .make(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedPaymentMethod = 'JazzCash';
                              });
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: _selectedPaymentMethod == 'JazzCash'
                                    ? Colors.red
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: 'JazzCash'
                                    .text
                                    .color(_selectedPaymentMethod == 'JazzCash'
                                        ? Colors.black
                                        : Colors.grey)
                                    .bold
                                    .size(15)
                                    .make(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).pOnly(top: 10),
                    InkWell(
                      onTap: _applyNow,
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF76FF03),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: 'Apply Now'.text.black.bold.size(15).make()),
                      ),
                    ).pOnly(top: 10),
                  ]),
            ),
          ),
        )));
  }

  Future<void> _applyNow() async {
    if (_selectedPaymentMethod == null) {
      return;
    }
    if (_phoneNumberController.text.trim().length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid 11-digit number')));
      return;
    }
    if (loanAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a valid loan amount')));
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Applied successfully')));

    await FirebaseFirestore.instance
        .collection('usersAppliedLoan')
        .doc(widget.userId)
        .set({
      'loanAmountApplied': loanAmount.toString(),
      'viaBank': _selectedPaymentMethod,
      'phNo': _phoneNumberController.text,
      'currentUID': widget.userId,
      'userName': widget.name,
    });
    Navigator.pop(context);
  }

  Row buildRow(String title) {
    double interest = loanAmount * 0.0;
    double gst = loanAmount * 0.05;
    double terms = loanAmount * 0.05;
    double serviceFee = loanAmount * 0.05;
    double receivedAmount = loanAmount - gst - serviceFee - terms;
    double dailyOverdueFee = loanAmount * 0.01;
    double repaymentAmount =
        loanAmount + interest + serviceFee + dailyOverdueFee;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        //  Text('Rs: ${loanAmount.toString()}'),
        if (title == 'Interest')
          Text('Rs: ${interest.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'GST') Text('Rs: ${gst.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Terms')
          Text('Rs: ${terms.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Service fee(+GST)')
          Text('Rs: ${serviceFee.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Received amount')
          Text('Rs: ${receivedAmount.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Daily Overdue fee')
          Text('Rs: ${dailyOverdueFee.toDoubleStringAsFixed(digit: 2)}'),
        if (title == 'Repayment amount')
          Text('Rs: ${repaymentAmount.toDoubleStringAsFixed(digit: 2)}'),
      ],
    );
  }
}
