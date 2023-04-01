import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Choose Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'lib/images/baby.jpg',
                width: 200, // Set the width of the image
                height: 200, // Set the height of the image
                fit: BoxFit.cover, // Set the fit of the image
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Register as',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  debugPrint("Register as a Surrogate Mother");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                ),
                child: const Text(
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                 'Surrogate Mother',
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'If you are an experienced surrogate mother or interested in becoming one.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  debugPrint("Register as Intended Parents");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                ),
                child: const Text(
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  'Intended Parents',
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Find surrogate mothers locally or worldwide who meet your preferences.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
