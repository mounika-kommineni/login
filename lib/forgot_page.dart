import 'package:flutter/material.dart';

void main() {
  runApp(ForgotPage());
}

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});
  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                labelText: 'Username',icon:Icon(Icons.person)
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Forgot Password'),
              onPressed: () {
                String username = AutofillHints.username;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Forgot Password', ),
                      content: Text('A password reset email has been sent to $username'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
