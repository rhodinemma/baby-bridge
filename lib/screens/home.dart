import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Baby Bridge',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Image.asset('lib/images/baby-clean.png'),
            onPressed: () {
              // do something when the image is pressed
            },
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (value) {
                switch(value) {
                  case 'view_profile':
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen1()),
                    );*/
                    break;
                  case 'sign_out':
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen2()),
                    );*/
                    break;
                  case 'terms_and_conditions':
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );*/
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'view_profile',
                    child: Text('View Profile'),
                  ),
                  const PopupMenuItem(
                    value: 'sign_out',
                    child: Text('Sign Out'),
                  ),
                  const PopupMenuItem(
                    value: 'terms_and_conditions',
                    child: Text('Terms and Conditions'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView());
  }
}
