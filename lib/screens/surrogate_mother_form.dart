import 'dart:io';

import 'package:baby_bridge/screens/home.dart';
import 'package:baby_bridge/screens/submit_surrogate_details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:baby_bridge/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geolocator/geolocator.dart';

class SurrogateMotherForm extends StatefulWidget {
  const SurrogateMotherForm({Key? key}) : super(key: key);

  @override
  State<SurrogateMotherForm> createState() => _SurrogateMotherFormState();
}

class _SurrogateMotherFormState extends State<SurrogateMotherForm> {
  final _formKey = GlobalKey<FormState>();
  final Geolocator geolocator = Geolocator();

  String? _fullName;
  String? _email;
  String? _description;

  bool _isLocalChecked = false;
  bool _isNationalChecked = false;
  bool _isInternationalChecked = false;

  String option1Text = "Need guidance";
  String option2Text = "Intermediate";
  String option3Text = "Experienced";

  String option4Text = "Yes";
  String option5Text = "No";

  String? _selectedOption;
  String? _selectedOption2;
  int newValueWithZeros = 0;
  int numberOfChildren = 0;
  int ageClaim = 0;

  final List<String> _countries = [
    'Uganda',
    'Kenya',
    'Tanzania',
    'Rwanda',
    'South Sudan',
    'Sudan',
  ];

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

  void _selectDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        // Do something with the file, such as upload it to a server
        debugPrint(file.name);
        debugPrint(file.path);
      } else {
        // User canceled the file selection
      }
    } catch (e) {
      debugPrint("Unsupported operation$e");
    }
  }

  void _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      print(position.longitude);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFBF9B),
        iconTheme: const IconThemeData(color: Colors.black),
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
                Icon(Icons.person, size: 30.0),
                Text(
                  'New Profile',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text("Anonymous Username: coastal-mom29",
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

          const Text("Share with us your location",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                minimumSize: MaterialStateProperty.all(const Size(150, 50)),
              ),
              onPressed: () {
                _getLocation();
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10), // add some space between the icon and the text
                    Text(
                      'Give location',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              )
            ),
          ),

          const SizedBox(height: 30.0),
          const Text("Are you a smoker?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),

          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              children: [
                RadioListTile<String>(
                  activeColor: Color(0xFFFFBF9B),
                  title: Text(option4Text),
                  value: option4Text,
                  groupValue: _selectedOption2,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption2 = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  activeColor: Color(0xFFFFBF9B),
                  title: Text(option5Text),
                  value: option5Text,
                  groupValue: _selectedOption2,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption2 = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 30.0),
          const Text("How many children have you given birth to?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Center(child: Text(numberOfChildren.toInt().toString())),
          SliderWidget(
            initialValue: 1,
            minValue: 0,
            maxValue: 20,
            onChanged: (newValue) {
              int absValue = newValue
                  .abs()
                  .toInt(); // take the absolute value and convert it to an integer

              setState(() {
                numberOfChildren = absValue;
              });
              debugPrint('New value with zeros: $numberOfChildren');
            },
          ),
          const SizedBox(height: 30.0),
          const Text("What is your age?",
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
                "The information you provide below will be used to connect you to intended parents (Full name, Photo, Email address)",
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
                    color: Colors.black,
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

          const SizedBox(height: 50.0),

          const Text(
              "Share any medical documents [HIV Status, Diabetes, Hepatitis B, etc.]",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFBF9B)),
                minimumSize: MaterialStateProperty.all(const Size(150, 50)),
              ),
              onPressed: () {
                _selectDocument();
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.file_copy,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10), // add some space between the icon and the text
                    Text(
                      'Upload medical documents',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              )
            ),
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

                        // redirect to home screen
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );*/

                        // show submit success screen if no errors
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubmitSurrogateDetails(),
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
