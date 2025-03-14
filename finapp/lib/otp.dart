import 'package:finapp/bankloan.dart';
import 'package:finapp/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Otppage extends StatelessWidget {
  const Otppage({super.key});

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
                const SizedBox(height: 150),
                Text(
                  "Enter your OTP",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
                ),
                const SizedBox(height: 25),
                Text(
                  "The First half will be in your email and the other in your mobile",
                   textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: primaryColor.withOpacity(0.7)),
                ),
                const SizedBox(height: 25),

                // Form Fields
                _buildTextField("Enter your OTP",keyboardType: TextInputType.number),
                const SizedBox(height: 30),
                
                

                // Continue Button
                ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BankLoansScreen()),
                            );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 14)),
                ),

                const SizedBox(height: 8),

              
               

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
