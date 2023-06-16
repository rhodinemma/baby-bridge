import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurrogateHome extends StatefulWidget {
  const SurrogateHome({Key? key}) : super(key: key);

  @override
  State<SurrogateHome> createState() => _SurrogateHomeState();
}

class _SurrogateHomeState extends State<SurrogateHome> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildImageWidget(String base64Image) {
    final Uint8List bytes = base64Decode(base64Image);
    return Image.memory(bytes);
  }

  ImageProvider _getImageProvider(String base64Image) {
    final Uint8List bytes = base64Decode(base64Image);
    return MemoryImage(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            _currentIndex == 0 ? 'Welcome' : _currentIndex == 1 ? 'Connections' : 'Profile',
          style: const TextStyle(
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
              ];
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeScreen(),
          _buildConnectionsScreen(),
          _buildProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF2E3840)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt, color: Color(0xFF2E3840)),
            label: 'Connections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF2E3840)),
            label: 'Profile',
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

  Widget _buildHomeScreen(){
    return const Center(
      child: Text(
        'Potential Parents will be listed here',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildConnectionsScreen(){
    return const Center(
      child: Text(
        'No connections available',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProfileScreen(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('surrogate_mothers').orderBy('createdAt', descending: true)
          .limit(1).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No data found',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic>  data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
            final avatarData = data['avatar'] as Map<String, dynamic>?;
            final base64Image = avatarData?['base64Image'] as String?;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: base64Image != null ? _getImageProvider(base64Image) : null,
                    radius: 80.0,
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextRow('Full Name', '${data['fullName'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Email', '${data['email'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Age', '${data['ageClaim'] ?? 'N/A'} years'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Description', '${data['description'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Country of Residence', '${data['countryOfResidence'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Location Preference', '${data['locationPreference'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Surrogacy Knowledge', '${data['surrogacyKnowledge'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Expected Compensation', 'UGX ${data['expectedCompensation'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Previous Number of Children', '${data['numberOfChildren'] ?? 'N/A'}'),
                  const SizedBox(height: 18.0),
                  _buildTextRow('Smoker', '${data['smoker'] ?? 'N/A'}'),
                  const SizedBox(height: 10.0),

                  ElevatedButton(
                    onPressed: () {
                      debugPrint("Leave App");
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SurrogateMotherForm()),
                      );*/
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.red),
                      minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                    ),
                    child: const Text(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      'Leave App',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0
            ),
          ),
          Text(value,
            style: const TextStyle(
              fontSize: 15.0
          ),),
        ],
      ),
    );
  }
}
