import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";

void main() {
  runApp(MyApp());
}

class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  ThemeMode _themeMode = ThemeMode.light;
  String _username = "";

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? "";
      _themeMode = (prefs.getBool('isDarkMode') ?? false) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _savePreferences(String username, bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setBool('isDarkMode', isDarkMode);
    setState(() {
      _username = username;
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Shared Preferences Example")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Enter your name"),
                onChanged: (value) {
                  _username = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode"),
                  Switch(
                    value: _themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      _savePreferences(_username, value);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _savePreferences(_username, _themeMode == ThemeMode.dark);
                },
                child: Text("Save Preferences"),
              ),
              SizedBox(height: 20),
              Text("Saved Name: $_username"),
            ],
          ),
        ),
      ),
    );
  }
}
