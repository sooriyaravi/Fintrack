import 'package:finapp/bankloan.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const Text(
                  "FINTRACK",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF21471E)),
                ),
                const SizedBox(height: 20),
              const Text(
                "Sign in to your account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF21471E)),
              ),
              const SizedBox(height: 5),
              Text(
                 "Enter Your Email ID to Sign in",
                 style: TextStyle(fontSize: 12, color: Color(0xFF21471E).withOpacity(0.7)),

                ),
              const SizedBox(height: 20),

              // Email TextField
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Color(0xFF21471E),
                decoration: InputDecoration(
                  hintText: "Enter Email ID",
                 hintStyle: TextStyle(color: Color(0xFF21471E).withOpacity(0.7), fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF21471E), width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF21471E), width: 1.2),
                  ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                ),
              ),

              const SizedBox(height: 15),

              // Password TextField with Visibility Toggle
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                keyboardType: TextInputType.visiblePassword,

                cursorColor: Color(0xFF21471E),
                decoration: InputDecoration(
                  hintText: "Enter password",
                 hintStyle: TextStyle(color: Color(0xFF21471E).withOpacity(0.7), fontSize: 12),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF21471E), width: 0.8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF21471E), width: 1.2),
                  ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Color(0xFF21471E),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  print("Email: $email, Password: $password");
                   Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BankLoansScreen()),
                          );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Color(0xFF21471E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Continue", style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 20),

              // OR Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1, color: Color(0xFF21471E))),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or", style: TextStyle(color: Color(0xFF21471E))),
                  ),
                  const Expanded(child: Divider(thickness: 1, color: Color(0xFF21471E))),
                ],
              ),

              const SizedBox(height: 20),

              // Google Sign-In Button
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                    const Text("Continue with Google", style: TextStyle(color: Colors.black,fontSize:12 )),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Apple Sign-In Button
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.apple, size: 24, color: Colors.black),
                    const SizedBox(width: 10),
                    const Text("Continue with Apple", style: TextStyle(color: Colors.black,fontSize: 12)),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Privacy Policy Statement
              Text(
  "By continuing, you agree to our Terms of Service and Privacy Policy.",
  style: TextStyle(fontSize: 10, color: Color(0xFF21471E).withOpacity(0.7)),
  textAlign: TextAlign.center,
),

            ],
          ),
        ),
      ),
    );
  }
}
