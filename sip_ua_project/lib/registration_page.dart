import 'package:flutter/material.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final SIPUAHelper helper = SIPUAHelper();
  final UaSettings settings = UaSettings();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettingsAndRegister();
  }

  Future<void> _loadSettingsAndRegister() async {
    final prefs = await SharedPreferences.getInstance();
    String wsUrl = prefs.getString('wsUrl') ?? 'ws://192.168.137.234:5060';
    String username = prefs.getString('username') ?? 'user1';
    String password = prefs.getString('password') ?? 'password1';

    settings.webSocketUrl = wsUrl;
    settings.uri = 'sip:$username@${wsUrl.split("://")[1]}';
    settings.authorizationUser = username;
    settings.password = password;
    settings.displayName = username;

    helper.start(settings);

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 80),
                  SizedBox(height: 20),
                  Text("Connected to SIP Server!", style: TextStyle(fontSize: 20)),
                ],
              ),
      ),
    );
  }
}
