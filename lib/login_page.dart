import 'package:flutter/material.dart';
import 'package:myapp/dashboard.dart';
import 'package:myapp/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool _visible = false;

  void _forgotPassword() async {
    // Show the alert dialog
    final emailController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Forgot Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your registered Email Id',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final email = emailController.text;
              if (email.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('A password reset link has been sent to $email'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
              Navigator.pop(context);
            },
            child: const Text('Send reset link'),
          ),
        ],
      ),
    );
  }

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
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                          Text(
                            'Log into your account',
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter the Email Id',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            // Add email format validation with a regular expression
                            final emailRegExp = RegExp(
                                r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?");
                            if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                        ), // Spacing between fields
                        const SizedBox(height: 10.0), // Spacing between fields
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _visible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _visible = !_visible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_visible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                _forgotPassword();
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 86, 17, 170),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
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
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // TODO: no return from dashboard
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Dashboard(),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('LOGIN',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account ? ',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 18.0),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign Up",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
