import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoanDetailsScreen extends StatefulWidget {
  const LoanDetailsScreen({Key? key}) : super(key: key);

  @override
  State<LoanDetailsScreen> createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 450,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select your Loan Amount',
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: '300',
                                      suffixIcon:
                                          Icon(Icons.arrow_drop_down_sharp),
                                      border: OutlineInputBorder()),
                                ),
                                Text(
                                  'Loan Details',
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black26),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      buildRow('Loan amount'),
                                      buildRow('Terms'),
                                      buildRow('GST'),
                                      buildRow('Service fee(+GST)'),
                                      buildRow('Interest'),
                                      buildRow('Received amount'),
                                      buildRow('Daily Overdue fee'),
                                      buildRow('Repayment amount'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text('Confirm Your Bank Account'),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'EasyPaisa   ********5222',
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                border: OutlineInputBorder()),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(child: Text('Apply Now')),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                value: null,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}

Row buildRow(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Text(title), Text('Rs: 0000')],
  );
}
