import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0(
        'auth0msfreelance.us.auth0.com', '59bIB6JQFSBJPlVS1fn9n3DIYvf7FpLz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final result =
                    auth0.webAuthentication(scheme: 'authpoc').login();
                print(jsonEncode(result));
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                auth0.webAuthentication(scheme: 'authpoc').logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
