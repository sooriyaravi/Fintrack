import 'package:finapp/waierchat.dart';
import 'package:flutter/material.dart';
import 'package:finapp/profile.dart';
import 'package:finapp/wagespenalty.dart';

class Prepayment extends StatefulWidget {
  @override
  _PrepaymentState createState() => _PrepaymentState();
}

class _PrepaymentState extends State<Prepayment> {
  bool isPenaltySelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WAIVERS AND PENALTY",
          style: TextStyle(color: Color(0xFF21471E), fontWeight: FontWeight.w400, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF21471E)),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF21471E)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(
                    text: "PENALTY",
                    isSelected: !isPenaltySelected,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Penalty()));
                    },
                  ),
                  SizedBox(width: 10),
                  ToggleButton(
                    text: "PREPAYMENT",
                    isSelected: isPenaltySelected,
                    onTap: () {
                      setState(() {
                        isPenaltySelected = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                BankCard(
                  bankName: "INDIAN BANK",
                  details: "Rs.100000 with 2% interest",
                  duration: "For 2 years, early by 3 months",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Waierchat()));
                  },
                ),
                BankCard(
                  bankName: "SBI BANK",
                  details: "Rs.150000 with 1.5% interest",
                  duration: "For 3 years, early by 6 months",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SbiBankDetails()));
                  },
                ),
                BankCard(
                  bankName: "HDFC BANK",
                  details: "Rs.200000 with 2.2% interest",
                  duration: "For 1.5 years, early by 4 months",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HdfcBankDetails()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  ToggleButton({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF21471E) : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Color(0xFF21471E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text),
    );
  }
}

class BankCard extends StatelessWidget {
  final String bankName;
  final String details;
  final String duration;
  final VoidCallback onTap;

  BankCard({required this.bankName, required this.details, required this.duration, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onTap: onTap, // Navigates to different pages
          leading: Icon(Icons.account_balance, size: 40, color: Color(0xFF21471E)),
          title: Text(bankName, style: TextStyle(fontWeight: FontWeight.w400)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(details, style: TextStyle(fontSize: 12)),
              Text(duration, style: TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF21471E)),
        ),
      ),
    );
  }
}

/// **Drawer Function**
Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF21471E)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF21471E)),
              ),
              SizedBox(height: 10),
              Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
              Text("useremail@example.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
        _buildDrawerItem(Icons.person, "Profile", () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        }),
        _buildDrawerItem(Icons.settings, "Settings", () {}),
        _buildDrawerItem(Icons.info, "About", () {}),
        _buildDrawerItem(Icons.help, "Help & Support", () {}),
        Divider(),
        _buildDrawerItem(Icons.logout, "Logout", () {}),
      ],
    ),
  );
}

Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: Color(0xFF21471E)),
    title: Text(title, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
    onTap: onTap,
  );
}



class SbiBankDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SBI Bank Details")),
      body: Center(child: Text("Details about SBI Bank loan prepayment.")),
    );
  }
}

class HdfcBankDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HDFC Bank Details")),
      body: Center(child: Text("Details about HDFC Bank loan prepayment.")),
    );
  }
}
