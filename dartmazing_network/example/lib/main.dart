
import 'package:dartmazing_network/dartmazing_network.dart';
import 'package:dartmazing_network_example/repositories.dart';
import 'package:dartmazing_network_example/repositories_request.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _repositoryName = 'Unknown';
  String _repositoryDescription = 'Unknown';
  String _repositoryStars = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String repositoryName;
    String repositoryDescription;
    String repositoryStars;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final network = DartmazingNetwork();
      final responseNative = await network.execute(request: RepositoriesRequest(),  factory: (json) => Repositories.fromJson(json));
      repositoryName = responseNative.response.items.first.name;
      repositoryDescription = responseNative.response.items.first.description;
      repositoryStars = "${responseNative.response.items.first.stargazersCount}";
    } on PlatformException {
      repositoryName = 'Failed to get data.';
      repositoryDescription = 'Failed to get data.';
      repositoryStars = 'Failed to get data.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _repositoryName = repositoryName;
      _repositoryDescription = repositoryDescription;
      _repositoryStars = repositoryStars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: $_repositoryName\n'),
              Text('Description: $_repositoryDescription\n'),
              Text('Start:: $_repositoryStars\n'),
            ],
          ),
        ),
      ),
    );
  }
}
