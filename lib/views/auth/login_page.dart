import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: email, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: password, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final err = await auth.login(email.text.trim(), password.text.trim());
                if (err != null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
              },
              child: Text('Login'),
            ),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignupPage())), child: Text('Create account'))
          ],
        ),
      ),
    );
  }
}
