import 'package:flutter/material.dart';
import 'package:sip_ua/sip_ua.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final SIPUAHelper helper = SIPUAHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a Call"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            helper.call('sip:destination@adresse_ip_du_serveur');
          },
          icon: Icon(Icons.phone, color: Colors.white),
          label: Text("Call Now", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
