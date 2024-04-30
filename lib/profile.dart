import 'package:bynry_casestudy_flutter/change_pwd.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildUserInfoSection(),
            const SizedBox(height: 55),
            _buildGeneralSection(context),
            _buildAboutAppSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 45.0,
          backgroundImage: AssetImage('images/man.png'),
        ),
        SizedBox(width: 30.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thomas Doe',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 5.0),
            Text(
              'thomas@gmail.com',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGeneralSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Change Password'),
          leading: const Icon(Icons.lock),
          trailing: const Icon(Icons.chevron_right),
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChangePasswordPage();
          })), // Navigation
        ),
      ],
    );
  }

  Widget _buildAboutAppSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Delete Account'),
          leading: const Icon(Icons.delete),
          trailing: const Icon(Icons.warning_amber_outlined, color: Colors.red),
          // onTap: (){},
          onTap: () => _confirmDeleteAccount(context), // Confirmation dialog
        ),
        ListTile(
          title: const Text('Logout'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {},
          // onTap: () => _logout(context), // Handle logout logic
        ),
      ],
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete Account'),
        content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final isDeleted = await _deleteAccount();
              if (isDeleted) {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Error deleting account. Please try again later.'),
                  ),
                );
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

// Simulate API call for account deletion (replace with actual API call)
  Future<bool> _deleteAccount() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    // TODO: this should return true
    return false; // Replace with actual success/failure logic from your API
  }
}
