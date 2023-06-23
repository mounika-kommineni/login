import 'package:dodo/forgot_page.dart';
import 'package:dodo/home_page.dart';
import 'package:dodo/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signin Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',icon: Icon(Icons.person)
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password', icon: Icon(Icons.lock)
              ),
            ),
               const SizedBox(height: 10),
            TextButton(
              child: const Text('Forgot Password'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ForgotPage();
               String username = _usernameController.text;
                      }
                    ),
                );
             },

            ),
            const SizedBox(height:10),
             ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HomePage();
              }
              ),
              );
              }
              ),
            const SizedBox(height: 10),
             ElevatedButton(
              child: const Text('Signup'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Signup_Page();   
              }
              ),
              );
              }
              ),
          ],
        ),
      ),
    );
  }
}
