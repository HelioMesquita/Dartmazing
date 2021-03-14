import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: Theme.of(context).backgroundColor,
              largeTitle: Text(
                S.of(context).aplicationName,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color
                ),
              ),
            )
          ];
        },
        body: Center(child: Text('Home Page'),),
      ),
    );
  }

}