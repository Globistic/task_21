import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:loan_app/screens/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../adminScrrens/adminScreen.dart';
import 'loginWithEmailScreen.dart';
import '../registrationScreens/otp_screen.dart';

class AddMobileNumberScreen extends StatefulWidget {
  const AddMobileNumberScreen({super.key});

  @override
  _AddMobileNumberScreenState createState() => _AddMobileNumberScreenState();
}

class _AddMobileNumberScreenState extends State<AddMobileNumberScreen> {
  var _selectedCountryCode = '+92';
  var phoneNumber = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController phNo = TextEditingController();

  bool loading = false;
  bool isAdmin = false;

  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    initialization();
    super.initState();
  }

  void _verifyPhoneNumber() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await _auth.verifyPhoneNumber(
        phoneNumber: '+${_selectedCountryCode}${phNo.text}',
        verificationCompleted: (_) async {
          setState(() {
            loading = false;
          });
          //  await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            loading = false;
          });
          Utils.toastMessage(e.toString());
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save the verification ID and resend token so we can use them later

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OTPScreen(verificationId: verificationId, phNo: phNo.text)),
          );
          setState(() {
            loading = false;
          });
          //phNo.text = '';
        },
        codeAutoRetrievalTimeout: (e) {
          Utils.toastMessage(e.toString());
          setState(() {
            loading = false;
          });
        },
        timeout: Duration(seconds: 60),
      );
    }
  }

  bool isValidNo(String value) {
    if (value == null || value.isEmpty) {
      // Phone number cannot be null or empty
      return false;
    }
    if (value.length != 10 && value.length != 11) {
      // Phone number must be exactly 10 or 11 digits long
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      // Phone number must contain only digits
      return false;
    }
    return true;
  }

  void initialization() async {
    debugPrint('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('go!------');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Please enter your mobile number to continue',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Neumorphic(
                      style: const NeumorphicStyle(
                        depth: 1,
                        intensity: 0.8,
                        shape: NeumorphicShape.flat,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.8, horizontal: 0.0),
                      child: CountryCodePicker(
                        onChanged: (CountryCode countryCode) {
                          setState(() {
                            _selectedCountryCode = countryCode.dialCode!;
                          });
                        },
                        initialSelection: '+92',
                        showFlagMain: true,
                        showFlag: true,
                        flagWidth: 68,
                        dialogSize: Size(500, 500),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: Neumorphic(
                      style: const NeumorphicStyle(
                        depth: 2,
                        intensity: 0.8,
                        shape: NeumorphicShape.flat,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.5, horizontal: 10),
                      child: TextFormField(
                        controller: phNo,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your no';
                          }
                          if (!isValidNo(value!)) {
                            return 'Please enter a valid no';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          phNo.text = value.toString();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Mobile Number',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            // NeumorphicButton(
            //   onPressed: () async {
            //     loading ? null : _verifyPhoneNumber();
            //   },
            //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //   style: NeumorphicStyle(
            //     boxShape: NeumorphicBoxShape.roundRect(
            //       BorderRadius.circular(30),
            //     ),
            //     depth: 1,
            //   ),
            //   child: loading
            //       ? Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text('Loading . . . '),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             CircularProgressIndicator(),
            //           ],
            //         )
            //       : Text('Continue',
            //           style: TextStyle(
            //             fontSize: 24,
            //             fontWeight: FontWeight.w600,
            //           )),
            // ),


            NeumorphicButton(
              onPressed: loading ? null : _verifyPhoneNumber,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(30),
                ),
                depth: 1,
              ),
              child: loading
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Loading . . . '),
                  SizedBox(
                    width: 5,
                  ),
                  CircularProgressIndicator(),
                ],
              )
                  : Text(
                'Continue',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),


            // SizedBox(height: 20),
            // TextButton(
            //   onPressed: () async {
            //     // Navigate to the login with email screen
            //
            //
            //     // final SharedPreferences prefs = await SharedPreferences.getInstance();
            //     // isAdmin = prefs.getBool('isAdmin') ?? false;
            //     // if (isAdmin) {
            //     //   Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
            //     //   );
            //     // } else {
            //     //   Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(builder: (context) => LoginWithEmailScreen()),
            //     //   );
            //     // }
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => LoginWithEmailScreen()),
            //     );
            //
            //   },
            //   child: const Text(
            //     'Login with Email',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.blue,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
