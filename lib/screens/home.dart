import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('You have no connections', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    Text('You have no messages', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              switch (value) {
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.teal),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt, color: Colors.teal),
            label: 'Connections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.teal),
            label: 'Messages',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
