import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> intendedParents = [
    'Intended Parent 1',
    'Intended Parent 2',
    'Intended Parent 3',
    'Intended Parent 4',
  ];

  final List<String> surrogateMothers = [
    'Surrogate Mother 1',
    'Surrogate Mother 2',
    'Surrogate Mother 3',
    'Surrogate Mother 4',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _showConnectModalForSurrogates(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('intended_parents')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            List<String> surrogateNames = snapshot.data!.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;
              return data['fullName'] as String;
            }).toList();

            return AlertDialog(
              title: const Text(
                'Connect to Intended Parent',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: DropdownButton<String>(
                value: surrogateNames.isNotEmpty ? surrogateNames[0] : null,
                items: surrogateNames.map((String surrogateName) {
                  return DropdownMenuItem<String>(
                    value: surrogateName,
                    child: Text(surrogateName),
                  );
                }).toList(),
                onChanged: (String? selectedParent) {
                  // Handle the selected parent
                  if (selectedParent != null) {
                    // Perform the connection logic here
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform the connection logic here
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                  ),
                  child: const Text(
                    'Connect',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showConnectModalForParents(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('surrogate_mothers')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            List<String> parentNames = snapshot.data!.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;
              return data['fullName'] as String;
            }).toList();

            return AlertDialog(
              title: const Text(
                'Connect to Surrogate Mother',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: DropdownButton<String>(
                value: parentNames.isNotEmpty ? parentNames[0] : null,
                items: parentNames.map((String parentName) {
                  return DropdownMenuItem<String>(
                    value: parentName,
                    child: Text(parentName),
                  );
                }).toList(),
                onChanged: (String? selectedParent) {
                  // Handle the selected parent
                  if (selectedParent != null) {
                    // Perform the connection logic here
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform the connection logic here
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                  ),
                  child: const Text(
                    'Connect',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
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
        title: const Text(
          'Dashboard',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFBF9B),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Registered Surrogates',
                  icon: Icon(Icons.person),
                ),
                Tab(
                  text: 'Intended Parents',
                  icon: Icon(Icons.family_restroom),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Surrogates tab
                  _surrogatesListing(),
                  // Intended Parents tab
                  _parentsListing(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _surrogatesListing() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('surrogate_mothers')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            var surrogateName = data['fullName'];
            var surrogateLocation = data['countryOfResidence'];
            var surrogateAge = data['ageClaim'];
            final avatarData = data['avatar'] as Map<String, dynamic>?;
            final base64Image = avatarData?['base64Image'] as String?;

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: base64Image != null
                      ? _getImageProvider(base64Image)
                      : null,
                  radius: 40.0,
                ),
                title: Text(
                  surrogateName ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Location: ${surrogateLocation ?? ''}, Age: ${surrogateAge ?? ''}',
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    _showConnectModalForSurrogates(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                  ),
                  child: const Text(
                    'Connect',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _parentsListing() {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('intended_parents').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            var parentName = data['fullName'];
            var agePreference = data['agePreference'];
            var countryPreference = data['countryPreference'];
            final avatarData = data['avatar'] as Map<String, dynamic>?;
            final base64Image = avatarData?['base64Image'] as String?;

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: base64Image != null
                      ? _getImageProvider(base64Image)
                      : null,
                  radius: 40.0,
                ),
                title: Text(
                  parentName ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Needed Age: ${agePreference ?? ''}, Needed Location: ${countryPreference ?? ''}',
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    _showConnectModalForParents(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                    minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                  ),
                  child: const Text(
                    'Connect',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
