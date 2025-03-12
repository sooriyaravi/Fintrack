import 'package:finapp/bankloan.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "PROFILE",
            style: TextStyle(color: Color(0xFF21471E)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF21471E)),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BankLoansScreen()),
                          );
              },
            ),
          ],
        ),
        drawer: Drawer(), // Placeholder for drawer menu
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Manage Account"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Color(0xFF21471E), size: 16),
                    SizedBox(width: 4),
                    Text(
                      "Level 2",
                      style: TextStyle(color: Color(0xFF21471E)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildTextField("Name", "User 1"),
                _buildTextField("Username", "Username"),
                _buildTextField("UPI ID", "acc@oksbi"),
                _buildTextField("Phone Number", "9876543210"),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Banks:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Color(0xFF21471E)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBankOption(Icons.account_balance, "Bank Accounts\n2"),
                    _buildBankOption(Icons.credit_card, "RuPay Credit\nCard"),
                    _buildBankOption(Icons.add_home, "Add Bank\nAccount"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF21471E)),
        ),
        SizedBox(height: 4),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildBankOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 50,color: Color(0xFF21471E),),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
