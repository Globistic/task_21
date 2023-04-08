import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'lending_amount_screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      children: [
                        LinearProgressIndicator(
                          value: 0.5, // 10% as decimal value
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
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

                  Center(
                    child: const Text(
                      'Marital Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    'Select In The Polloing',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Neumorphic(
                    margin: const EdgeInsets.only(top: 10),
                    style: const NeumorphicStyle(
                      color: Colors.lightGreen,
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Neumorphic(
                                  style: const NeumorphicStyle(
                                    depth: 10,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                    lightSource: LightSource.topLeft,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.person),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Single',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Neumorphic(
                                  style: const NeumorphicStyle(
                                    depth: 10,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.people),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Married',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Neumorphic(
                                  style: const NeumorphicStyle(
                                    depth: 2,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.remove_circle),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Widow',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    depth: 2,
                                    intensity: 0.8,
                                    shape: NeumorphicShape.flat,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.mood_bad),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Divorced',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Neumorphic(
                    margin: const EdgeInsets.only(top: 10),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'How Many Childers You Have With You',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Neumorphic(
                    margin: const EdgeInsets.only(top: 10),
                    style: NeumorphicStyle(
                      depth: 2,
                      intensity: 0.8,
                      shape: NeumorphicShape.flat,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Your Qualification',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LendingAmountScreen()),
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

                  // const Text(
                  //   'Highest Level of Education',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Neumorphic(
                  //   margin: const EdgeInsets.only(top: 10),
                  //   style: const NeumorphicStyle(
                  //     color: Colors.lightGreen,
                  //
                  //     depth: 2,
                  //
                  //     intensity: 0.8,
                  //     shape: NeumorphicShape.flat,
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 10),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Neumorphic(
                  //                 style: NeumorphicStyle(
                  //
                  //                   depth: 2,
                  //
                  //                   intensity: 0.8,
                  //                   shape: NeumorphicShape.flat,
                  //                 ),
                  //                 padding: const EdgeInsets.all(10),
                  //                 child: const Icon(Icons.school),
                  //               ),
                  //             ),
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Neumorphic(
                  //                 style: const NeumorphicStyle(
                  //                   depth: 2,
                  //
                  //                   intensity: 0.8,
                  //                   shape: NeumorphicShape.flat,
                  //                 ),
                  //                 padding: const EdgeInsets.all(10),
                  //                 child: const Icon(Icons.work),
                  //               ),
                  //             ),
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Neumorphic(
                  //                 style: const NeumorphicStyle(
                  //                   depth: 2,
                  //
                  //                   intensity: 0.8,
                  //                   shape: NeumorphicShape.flat,
                  //                 ),
                  //                 padding: const EdgeInsets.all(10),
                  //                 child: const Icon(Icons.star),
                  //               ),
                  //             ),
                  //             GestureDetector(
                  //               onTap: () {},
                  //               child: Neumorphic(
                  //                 style: const NeumorphicStyle(
                  //                   depth: 2,
                  //
                  //                   intensity: 0.8,
                  //                   shape: NeumorphicShape.flat,
                  //                 ),
                  //                 padding: const EdgeInsets.all(10),
                  //                 child: const Icon(Icons.account_balance),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(height: 10),
                  //         const Text(
                  //           'Select your highest level of education achieved',
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
