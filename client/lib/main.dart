import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  late User? user;

  @override
  void initState() {
    super.initState();
    http.get(Uri.parse("http://localhost:8080")).then((response) {
      setState(() {
        user = User.fromJson(jsonDecode(response.body));
      });
    });

    // user = const User(id: 'Steve', name: 'steeve@mail.ru');
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
            if (user == null) const CircularProgressIndicator.adaptive(),
            if (user != null)
              Text(
                user!.name,
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
    );
  }
}
