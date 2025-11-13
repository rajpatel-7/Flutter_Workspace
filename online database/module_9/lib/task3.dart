import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingAnimationScreen(),
    );
  }
}

class LoadingAnimationScreen extends StatefulWidget {
  @override
  _LoadingAnimationScreenState createState() => _LoadingAnimationScreenState();
}

class _LoadingAnimationScreenState extends State<LoadingAnimationScreen> {
 
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3)); 
    return "Data successfully loaded!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loading Animation Example")),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(), 
                  SizedBox(height: 20),
                  Text("Fetching data, please wait..."),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
            
              return Text(snapshot.data ?? "No Data", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
            }
          },
        ),
      ),
    );
  }
}

