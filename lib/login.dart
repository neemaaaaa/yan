import 'package:flutter/material.dart';
import 'package:yan/cours/home_page .dart';
import 'signup.dart';
import 'forgetpwd.dart';

class LoginScreen extends StatelessWidget {
  static const Color primaryColor = Color(0xFF4B145B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text('Email Address', style: TextStyle(fontWeight: FontWeight.w600 ,  color: Color(0xFF4B145B))),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              Text('Password', style: TextStyle(fontWeight: FontWeight.w600 ,  color: Color(0xFF4B145B))),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text('Forgot Password?', style: TextStyle(color: primaryColor)),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainNavigationPage(),
                    ),
                  );},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 18,  color: Colors.white,) , ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
