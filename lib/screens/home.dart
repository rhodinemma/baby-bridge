import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      _buildListView(),
      const Text('You have no connections',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      const Text('You have no messages',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    ];
  }

  ListView _buildListView() {
    return ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.white70,
          child: SizedBox(
            width: 300,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  //SizedBox
                  const Text(
                    'coastal-moms012',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'SURROGATE',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Nationality:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Uganda',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Contact Preference:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Local',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Surrogacy Knowledge:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Intermediate',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Fee expectations:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'UGX 35M',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Age:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '25',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Smoker:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.smoke_free, size: 20.0),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 20.0),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  //Text//SizedBox
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.add_reaction, size: 27.0),
                        Icon(Icons.message, size: 27.0),
                      ],
                    ),
                    //SizedBox
                  ),
                ], //Widget
              ), //Column
            ), //Padding
          ), //SizedBox
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.white70,
          child: SizedBox(
            width: 300,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  //SizedBox
                  const Text(
                    'anonymous-goat4',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'SURROGATE',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Nationality:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Kenya',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Contact Preference:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'International',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Surrogacy Knowledge:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Need guidance',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Fee expectations:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'UGX 40M',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Age:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '30',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Smoker:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.smoke_free, size: 20.0),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 20.0),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  //Text//SizedBox
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.add_reaction, size: 27.0),
                        Icon(Icons.message, size: 27.0),
                      ],
                    ),
                    //SizedBox
                  ),
                ], //Widget
              ), //Column
            ), //Padding
          ), //SizedBox
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.white70,
          child: SizedBox(
            width: 300,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  //SizedBox
                  const Text(
                    'lovely-pie99',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'SURROGATE',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Nationality:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Uganda',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Contact Preference:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'National',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Surrogacy Knowledge:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Experienced',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Fee expectations:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'UGX 50M',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Age:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '34',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Smoker:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.smoke_free, size: 20.0),
                      ],
                    ),
                    //SizedBox
                  ),

                  const SizedBox(height: 20.0),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  //Text//SizedBox
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.add_reaction, size: 27.0),
                        Icon(Icons.message, size: 27.0),
                      ],
                    ),
                    //SizedBox
                  ),
                ], //Widget
              ), //Column
            ), //Padding
          ), //SizedBox
        ),
      ),//Card
    ]);
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
        iconSize: 30.0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
