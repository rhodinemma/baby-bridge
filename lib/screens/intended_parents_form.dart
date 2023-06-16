import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:baby_bridge/screens/home.dart';
import 'package:baby_bridge/screens/submit_parent_details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:baby_bridge/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IntendedParentsForm extends StatefulWidget {
  const IntendedParentsForm({Key? key}) : super(key: key);

  @override
  State<IntendedParentsForm> createState() => _IntendedParentsFormState();
}

class _IntendedParentsFormState extends State<IntendedParentsForm> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  String? _fullName;
  String? _email;
  String? _description;

  bool _isLocalChecked = false;
  bool _isNationalChecked = false;
  bool _isInternationalChecked = false;

  String option1Text = "Need guidance";
  String option2Text = "Intermediate";
  String option3Text = "Experienced";

  int newValueWithZeros = 0;
  int ageClaim = 0;

  final List<String> _countries = [
    'Uganda',
    'Kenya',
    'Tanzania',
    'Rwanda',
    'South Sudan',
    'Sudan',
  ];

  String? _selectedOption;
  String? _selectedCountry;

  // This is the file that will be used to store the image
  File? _image;
  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _saveFormValues() async {
    CollectionReference formValues =
    firestore.collection('intended_parents'); // Choose a collection name

    final base64Image = _convertImageToBase64(_image!);
    final imageData = {'base64Image': base64Image};

    final anonymousName = 'anonymous-${generateRandomString(6)}';

    await formValues.add({
      'avatar': imageData,
      'anonymousName': anonymousName,
      'fullName': _fullName,
      'email': _email,
      'description': _description,
      'agePreference': ageClaim,
      'surrogacyKnowledge': _selectedOption,
      'countryPreference': _selectedCountry,
      'locationPreference': _isLocalChecked ? "Local" : _isNationalChecked ? "National" : "International",
      'expectedCompensation': newValueWithZeros,
      'createdAt': DateTime.now(),
    }).then((value) {
      print('Form values saved successfully!');
    }).catchError((error) {
      print('Failed to save form values: $error');
    });
  }

  String _convertImageToBase64(File image) {
    final bytes = image.readAsBytesSync();
    final base64Image = base64Encode(bytes);
    return base64Image;
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final codeUnits = List<int>.generate(length, (index) => chars.codeUnitAt(random.nextInt(chars.length)));
    return String.fromCharCodes(codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Row(
            children: const [
              Icon(Icons.person, size: 30.0),
              Text(
                'My Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.black),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFBF9B),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text("Anonymous Username: coastal-parent01",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
          const SizedBox(height: 30.0),
          const Text("Location Preference",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(children: [
              CheckboxListTile(
                activeColor: Color(0xFFFFBF9B),
                value: _isLocalChecked,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _isLocalChecked = value!;
                  });
                },
                title: const Text("Local"),
              ),
              CheckboxListTile(
                activeColor: Color(0xFFFFBF9B),
                value: _isNationalChecked,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _isNationalChecked = value!;
                  });
                },
                title: const Text("National"),
              ),
              CheckboxListTile(
                activeColor: Color(0xFFFFBF9B),
                value: _isInternationalChecked,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _isInternationalChecked = value!;
                  });
                },
                title: const Text("International"),
              ),
            ]),
          ),
          const SizedBox(height: 30.0),
          const Text("What do you know about Surrogacy?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              children: [
                RadioListTile<String>(
                  activeColor: Color(0xFFFFBF9B),
                  title: Text(option1Text),
                  value: option1Text,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  activeColor: Color(0xFFFFBF9B),
                  title: Text(option2Text),
                  value: option2Text,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  activeColor: Color(0xFFFFBF9B),
                  title: Text(option3Text),
                  value: option3Text,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          const Text("Inconvenience fee expectations (UGX Shillings)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10.0),
          Center(
              child: Text(newValueWithZeros.toInt().toString().replaceAllMapped(
                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) =>
                  '${m[1]},'))), // format the integer value with commas
          const SizedBox(height: 10.0),
          SliderWidget(
            initialValue: 20,
            minValue: 0,
            maxValue: 100,
            onChanged: (newValue) {
              int absValue = newValue
                  .abs()
                  .toInt(); // take the absolute value and convert it to an integer
              newValueWithZeros =
                  absValue * 1000000; // add six zeros to the integer value
              setState(() {
                newValueWithZeros = newValueWithZeros;
              });
              debugPrint('New value with zeros: $newValueWithZeros');
            },
          ),
          const SizedBox(height: 30.0),
          const Text("Age Preference",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Center(child: Text(ageClaim.toInt().toString())),
          SliderWidget(
            initialValue: 25,
            minValue: 21,
            maxValue: 40,
            onChanged: (newValue) {
              int absValue = newValue
                  .abs()
                  .toInt(); // take the absolute value and convert it to an integer

              setState(() {
                ageClaim = absValue;
              });
            },
          ),
          const SizedBox(height: 30.0),
          const Text("Country Preference",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30.0),
          Center(
            child: DropdownButton<String>(
              // Step 3.
              value: _selectedCountry,
              // Step 4.
              items: _countries.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 25),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                });
              },
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: Row(
              children: const [
                Icon(Icons.lock, size: 30.0),
                Text(
                  'Private Credentials',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "The information you provide below will be used to connect you to surrogate mothers (Full name, Photo, Email address)",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 30.0),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _openImagePicker,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFFFBF9B),
                  radius: 75,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? const Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.black
                  )
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tap to upload a photo',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 30.0),

          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _fullName = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Introduce yourself in few words',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please tell us about yourself';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFFFFBF9B)),
                      minimumSize:
                      MaterialStateProperty.all(const Size(150, 50)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Do something with the form data
                        debugPrint('Full Name: $_fullName');
                        debugPrint('Email: $_email');
                        debugPrint('Description: $_description');

                        _saveFormValues();

                        // redirect to home screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubmitParentsDetails(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Submit Details',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
