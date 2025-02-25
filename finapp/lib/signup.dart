import 'package:finapp/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 180), // Increased top padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Create your account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "Enter your details to Sign Up",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Username TextField
              TextField(
                cursorColor: Colors.black,
                cursorWidth: 0.8, 
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1.2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
              ),

              const SizedBox(height: 15),

              // Email TextField
              TextField(
                cursorColor: Colors.black,
                cursorWidth: 0.8, 
                decoration: InputDecoration(
                  hintText: "Enter Email ID",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1.2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
              ),

              const SizedBox(height: 15),

              // Password TextField
              TextField(
                cursorColor: Colors.black,
                cursorWidth: 0.8, 
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1.2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
              ),

              const SizedBox(height: 15),

              // Continue Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Continue", style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "Sign in",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              // OR Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or", style: TextStyle(color: Colors.grey)),
                  ),
                  const Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 20),

              // Google Sign-In Button
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300], 
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    const Text("Continue with Google", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Apple Sign-In Button
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.apple, size: 24, color: Colors.black),
                    const SizedBox(width: 10),
                    const Text("Continue with Apple", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Terms and Privacy Policy
              const Text(
                "By clicking continue, you agree to our Terms of Service and Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
