import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: name, decoration: InputDecoration(labelText: 'Full Name')),
            TextField(controller: email, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: password, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final err = await auth.signup(email.text.trim(), password.text.trim(), name.text.trim());
                if (err != null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                else Navigator.pop(context);
              },
              child: Text('Create Account'),
            )
          ],
        ),
      ),
    );
  }
}
