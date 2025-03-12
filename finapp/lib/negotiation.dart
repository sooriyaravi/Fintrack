import 'package:finapp/loanlist.dart';
import 'package:flutter/material.dart';


class Negotiation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: Icon(Icons.menu, color: Color(0xFF21471E)),
        title: Text(
          'NEGOTIATOR',
          style: TextStyle(color: Color(0xFF21471E), fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        actions: [Icon(Icons.account_circle, color: Color(0xFF21471E))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Smart Deals, Better Rates',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Learn more->',
                          style: TextStyle(color: Color(0xFF21471E).withOpacity(0.7), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  sectionTitle('LIVE NEGOTIATOR:'),
                ],
              ),
            ),
            featureGrid(context, [
              'LOAN TERMS & RATE NEGOTIATION',
              'FLEXIBLE REPAYMENT OPTIONS',
              'PENALTY & PREPAYMENT WAIVERS',
              'GRACE PERIOD ADJUSTMENT'
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: sectionTitle('FEATURES:'),
            ),
            featureGrid(context, [
              'BOOST CREDIT SCORE',
              'LOAN READINESS ANALYSIS',
              'SIMULATED OFFER COMPARISONS',
              'BEST DEAL FINDER & RAPID SETTLEMENT OFFERS'
            ]),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF21471E),
      ),
    );
  }

  Widget featureGrid(BuildContext context, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      
      child: GridView.builder(
        
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1, // Makes the boxes square
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoanListScreen()
                ),
              );
            },
            child: featureCard(items[index]),
          );
        },
      ),
    );
  }

  Widget featureCard(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_balance, size: 40, color: Color(0xFF21471E).withOpacity(0.7)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
