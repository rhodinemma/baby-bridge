import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'create_profile.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String userNumber = '';
  var otpFieldVisibility = false;
  var receivedID = '';
  bool _isChecked = false;

  void verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: userNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => debugPrint('Logged In Successfully'),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        otpFieldVisibility = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTPCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otpController.text,
    );
    await auth.signInWithCredential(credential).then((value) {
      debugPrint('User Login In Successful');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateProfile()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Getting Started',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Image.asset(
              'lib/images/baby.jpg',
              width: 150, // Set the width of the image
              height: 150, // Set the height of the image
              fit: BoxFit.cover, // Set the fit of the image
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Please provide your phone number below',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'UG',
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  userNumber = val.completeNumber;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Visibility(
                visible: otpFieldVisibility,
                child: TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    hintText: 'OTP Code',
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: otpFieldVisibility,
              child: CheckboxListTile(
                activeColor: Colors.teal,
                controlAffinity: ListTileControlAffinity.leading,
                value: _isChecked,
                title: const Text(
                    'I am over the age of 21 years and I accept terms of use'),
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (otpFieldVisibility) {
                  verifyOTPCode();
                } else {
                  verifyUserPhoneNumber();
                }
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                minimumSize: MaterialStateProperty.all(const Size(150, 50)),
              ),
              child: Text(
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                otpFieldVisibility ? 'Login' : 'Verify',
              ),
            )
          ],
        ),
      ),
    );
  }
}
