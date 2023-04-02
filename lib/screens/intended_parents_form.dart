import 'dart:io';

import 'package:baby_bridge/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:baby_bridge/widgets/slider.dart';
import 'package:flutter/material.dart';

class IntendedParentsForm extends StatefulWidget {
  const IntendedParentsForm({Key? key}) : super(key: key);

  @override
  State<IntendedParentsForm> createState() => _IntendedParentsFormState();
}

class _IntendedParentsFormState extends State<IntendedParentsForm> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    debugPrint("Delete Account");
                  },
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    debugPrint("My Subscription");
                  },
                  child: const Text(
                    'My Subscription',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
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
                Icon(Icons.lock_clock, size: 30.0),
                Text(
                  'Under Review',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text("Intended Parent Details",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 20.0),
          const Text("Anonymous Username: coastal-parent01",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
          const SizedBox(height: 30.0),
          const Text("Accepting contacts",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(children: [
              CheckboxListTile(
                activeColor: Colors.teal,
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
                activeColor: Colors.teal,
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
                activeColor: Colors.teal,
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
                  activeColor: Colors.teal,
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
                  activeColor: Colors.teal,
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
                  activeColor: Colors.teal,
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
          const Text("Your Country of Residence",
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
                  'Private Profile',
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
                "Only contacts you have accepted will have access to some of your private information (Full name, Photo, Email address)",
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
                  backgroundColor: Colors.teal,
                  radius: 75,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? const Icon(
                    Icons.camera_alt,
                    size: 50,
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
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
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
                        // redirect to home screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Save Profile',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
