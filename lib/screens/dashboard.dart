import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
                          title: Text('Surrogate ${index + 1}'),
                          subtitle: const Text('Surrogate details'),
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
                          title: Text('Intended Parent ${index + 1}'),
                          subtitle: const Text('Intended Parent details'),
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
