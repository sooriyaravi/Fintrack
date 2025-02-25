import 'package:finapp/dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                "Sign in to your account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "Sign in",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Email TextField
              TextField(
                cursorColor: Colors.black,
                cursorWidth: 0.8, // Set cursor blinker color to black
                decoration: InputDecoration(
                  hintText: "email@domain.com",
                  hintStyle: const TextStyle(color: Colors.grey,fontSize: 14), // Placeholder color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(color: Colors.grey, width: 0.8), // Default border color
                  ),
                  focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 1.2) // Black border when focused
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

              // Google Sign-In Button (Light Grey Background, No Border)
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Light grey background
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
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, color: Colors.red);
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text("Continue with Google", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Apple Sign-In Button (Light Grey Background, No Border)
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Light grey background
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
