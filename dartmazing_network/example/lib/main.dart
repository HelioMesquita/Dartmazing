import 'package:dartmazing_network/dartmazing_network.dart';
import 'package:dartmazing_network/dartmazing_network_web.dart';
import 'package:dartmazing_network_example/repositories.dart';
import 'package:dartmazing_network_example/repositories_request.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: $_repositoryName\n'),
              Text('Description: $_repositoryDescription\n'),
              Text('Start:: $_repositoryStars\n'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String repositoryName;
            String repositoryDescription;
            String repositoryStars;

            try {
              dynamic network;
              if (kIsWeb) {
                network = DartmazingNetworkWeb();
              } else {
                network = DartmazingNetwork();
              }

              final responseNative = await network.execute(
                  request: RepositoriesRequest(),
                  factory: (json) => Repositories.fromJson(json));
              repositoryName = responseNative.response.items.first.name;
              repositoryDescription =
                  responseNative.response.items.first.description;
              repositoryStars =
                  "${responseNative.response.items.first.stargazersCount}";
            } on PlatformException {
              repositoryName = 'Failed to get data.';
              repositoryDescription = 'Failed to get data.';
              repositoryStars = 'Failed to get data.';
            }

            if (!mounted) return;

            setState(() {
              _repositoryName = repositoryName;
              _repositoryDescription = repositoryDescription;
              _repositoryStars = repositoryStars;
            });
          },
        ),
      ),
    );
  }
}
