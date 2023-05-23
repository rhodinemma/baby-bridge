import 'package:baby_bridge/screens/parents_home.dart';
import 'package:flutter/material.dart';


class SubmitParentsDetails extends StatefulWidget {
  const SubmitParentsDetails({Key? key}) : super(key: key);

  @override
  State<SubmitParentsDetails> createState() => _SubmitParentsDetailsState();
}

class _SubmitParentsDetailsState extends State<SubmitParentsDetails> {
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
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Your details have been submitted for review and will be used to connect you to surrogate mothers.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                debugPrint("Continue");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ParentsHome()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                minimumSize: MaterialStateProperty.all(const Size(150, 50)),
              ),
              child: const Text(
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                'Continue...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
