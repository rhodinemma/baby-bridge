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
        return AlertDialog(
          title: const Text('Connect to Intended Parent', style: TextStyle(fontWeight: FontWeight.bold),),
          content: DropdownButton<String>(
            value: intendedParents.first,
            items: intendedParents.map((String parent) {
              return DropdownMenuItem<String>(
                value: parent,
                child: Text(parent),
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
                backgroundColor: MaterialStateProperty.all(const Color(0xFFFFBF9B)),
              ),
              child: const Text(
                'Connect',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showConnectModalForParents(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Connect to Surrogate Mother', style: TextStyle(fontWeight: FontWeight.bold),),
          content: DropdownButton<String>(
            value: surrogateMothers.first,
            items: surrogateMothers.map((String parent) {
              return DropdownMenuItem<String>(
                value: parent,
                child: Text(parent),
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
                backgroundColor: MaterialStateProperty.all(const Color(0xFFFFBF9B)),
              ),
              child: const Text(
                'Connect',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
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
                  ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            'Surrogate ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Surrogate details'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showConnectModalForSurrogates(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                              minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                            ),
                            child: const Text('Connect', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      );
                    },
                  ),
                  // Intended Parents tab
                  ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('Intended Parent ${index + 1}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: const Text('Intended Parent details'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              _showConnectModalForParents(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(const Color(0xFFFFBF9B)),
                              minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                            ),
                            child: const Text('Connect', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
