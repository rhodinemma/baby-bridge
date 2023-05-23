import 'package:flutter/material.dart';


class SubmitSurrogateDetails extends StatefulWidget {
  const SubmitSurrogateDetails({Key? key}) : super(key: key);

  @override
  State<SubmitSurrogateDetails> createState() => _SubmitSurrogateDetailsState();
}

class _SubmitSurrogateDetailsState extends State<SubmitSurrogateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Success',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFBF9B),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Your details have been submitted for review and will be used to match you to intended parents.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
