import 'package:flutter/material.dart';

class SurrogateHome extends StatefulWidget {
  const SurrogateHome({Key? key}) : super(key: key);

  @override
  State<SurrogateHome> createState() => _SurrogateHomeState();
}

class _SurrogateHomeState extends State<SurrogateHome> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Text('You have no connections',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      const Text('You have no active contracts',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      const Text('You have no messages',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    ];
  }

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
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFBF9B),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
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
                case 'payment_history':
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );*/
                  break;
                case 'contact_support':
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );*/
                  break;
                case 'report':
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );*/
                  break;
                case 'legal_resources':
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
                  value: 'payment_history',
                  child: Text('Payment History'),
                ),
                const PopupMenuItem(
                  value: 'legal_resources',
                  child: Text('Legal Resources'),
                ),
                const PopupMenuItem(
                  value: 'contact_support',
                  child: Text('Contact Support'),
                ),
                const PopupMenuItem(
                  value: 'report',
                  child: Text('Report'),
                ),
                const PopupMenuItem(
                  value: 'sign_out',
                  child: Text('Sign Out'),
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
            icon: Icon(Icons.people_alt, color: Color(0xFF2E3840)),
            label: 'Connections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long, color: Color(0xFF2E3840)),
            label: 'Contracts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Color(0xFF2E3840)),
            label: 'Messages',
          ),
        ],
        iconSize: 30.0,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2E3840),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
