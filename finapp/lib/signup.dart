import 'package:finapp/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  final Color primaryColor = const Color(0xFF21471E); // Define primary color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Color.fromARGB(255, 255, 255, 255),

      resizeToAvoidBottomInset: true, // Prevents keyboard overflow issue
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, // Dismiss keyboard on scroll
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "FINTRACK",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: primaryColor),
                ),
                const SizedBox(height: 20),
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
                ),
                const SizedBox(height: 5),
                Text(
                  "Enter your details to Sign Up",
                  style: TextStyle(fontSize: 12, color: primaryColor.withOpacity(0.7)),
                ),
                const SizedBox(height: 15),

                // Form Fields
                _buildTextField("Enter Email ID",keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                _buildTextField("Enter Phone Number",keyboardType: TextInputType.phone),
                const SizedBox(height: 10),
                _buildTextField("Enter Username",keyboardType: TextInputType.name),
                const SizedBox(height: 10),
                _buildTextField("Enter Password", obscureText: true),
                const SizedBox(height: 10),
                _buildTextField("Confirm Password", obscureText: true),

                const SizedBox(height: 12),

                // Continue Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 14)),
                ),

                const SizedBox(height: 8),

                // Sign In Navigation
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(fontSize: 12, color: primaryColor.withOpacity(0.7)),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // OR Divider
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 0.8, color: primaryColor.withOpacity(0.7))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text("or", style: TextStyle(color: primaryColor.withOpacity(0.7), fontSize: 12)),
                    ),
                    Expanded(child: Divider(thickness: 0.8, color: primaryColor.withOpacity(0.7))),
                  ],
                ),

                const SizedBox(height: 12),

                // Social Login Buttons
                _buildSocialButton("Continue with Google", "assets/images/google.png"),
                const SizedBox(height: 8),
                _buildSocialButton("Continue with Apple", null, icon: Icons.apple),

                const SizedBox(height: 12),

                // Terms and Privacy Policy
                Text(
                  "By clicking continue, you agree to our Terms of Service and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor.withOpacity(0.7), fontSize: 10),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TextField Widget
 Widget _buildTextField(String hint, {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
  return TextField(
    cursorColor: primaryColor,
    cursorWidth: 0.8,
    obscureText: obscureText,
    keyboardType: keyboardType, // Set keyboard type
    style: TextStyle(fontSize: 12, color: primaryColor),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: primaryColor.withOpacity(0.7), fontSize: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 0.6),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 1.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      
    ),
  );
}


  // Social Login Button Widget
  Widget _buildSocialButton(String text, String? imagePath, {IconData? icon}) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[300],
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Image.asset(imagePath, width: 20, height: 20)
          else if (icon != null)
            Icon(icon, size: 30, color: Colors.black),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }
}
