import 'package:flutter/material.dart';

class DashboardViewpage extends StatelessWidget {
  const DashboardViewpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserSection(),
            _buildQuickActionsSection(),
            const Divider(
              thickness: 10.0,
              color: Color.fromARGB(255, 196, 192, 192),
              endIndent: 0.0,
              indent: 0.0,
              height: 10.0,
            ),
            _buildGasSection(),
          ],
        ),
      ),
    );
  }

  // User Section
  Widget _buildUserSection() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 0, 30),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/man.png'),
            radius: 30,
          ),
          SizedBox(width: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                    fontSize: 25.0, color: Color.fromARGB(255, 229, 189, 128)),
              ),
              Text(
                'Thomas',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Quick Actions Section
  Widget _buildQuickActionsSection() {
    final quickActions = [
      {'icon': Icons.receipt_long, 'label': 'Bills'},
      {'icon': Icons.assignment, 'label': 'Disconnect'},
      {'icon': Icons.assignment, 'label': 'Transfer'},
      {'icon': Icons.receipt_long, 'label': 'Services'},
      {'icon': Icons.support_agent, 'label': 'Complain'},
      {'icon': Icons.pending_actions, 'label': 'Update'},
      {'icon': Icons.pending_actions, 'label': 'Connection'},
      {'icon': Icons.pending_actions, 'label': 'Outage'},
    ];

    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust corner radius as desired
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 170.0, vertical: 2),
            child: Divider(color: Colors.black, thickness: 3.0),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Quick Actions',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: List.generate(quickActions.length,
                  (index) => _buildQuickActionItem(quickActions[index])),
            ),
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _buildQuickActionItem(Map<String, dynamic> action) {
    return Column(
      children: [
        IconButton(
          icon: Icon(action['icon']),
          onPressed: () {},
        ),
        Text(action['label']),
      ],
    );
  }

  // Gas Section
  Widget _buildGasSection() {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  'Gas  | ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  ' SA1234567',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(width: 1.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: const Row(
                    children: [
                      Text("Last Month"),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              elevation: 20.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
              ),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 5.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                title: const Text(
                  'Bills',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: const Text(
                  '20 Jan 2020',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: const Text(
                  '43 \$',
                  style: TextStyle(color: Colors.orange, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
