import 'package:flutter/material.dart';
import 'package:myapp/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text elements positioned at the top
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                          Text(
                            'Create your account',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              // Login form card
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Email Id',
                        ),
                      ),
                      const SizedBox(height: 10.0), // Spacing between fields
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 10.0), // Spacing between fields
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      // Login button
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[900],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onPressed: () {
                                // Handle login button press
                              },
                              child: const Text('REGISTER',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account ? ',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 18.0),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 86, 17, 170),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
