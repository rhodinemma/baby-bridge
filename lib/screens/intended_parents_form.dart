import 'package:flutter/material.dart';

class IntendedParentsForm extends StatefulWidget {
  const IntendedParentsForm({Key? key}) : super(key: key);

  @override
  State<IntendedParentsForm> createState() => _IntendedParentsFormState();
}

class _IntendedParentsFormState extends State<IntendedParentsForm> {
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
      body: ListView(),
    );
  }
}
