import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/detail_cubit.dart';

class DetailPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, DetailState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: CupertinoNavigationBar(),
          body: Container(),
          // body: NestedScrollView(
          //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          //     return <Widget>[
          //       CupertinoSliverNavigationBar(
          //         border: Border.all(color: Colors.transparent),
          //         backgroundColor: Theme.of(context).backgroundColor,
          //         // largeTitle: Text(
          //         //   "S.of(context).aplicationName",
          //         //   style: TextStyle(
          //         //     color: Theme.of(context).textTheme.headline6.color
          //         //   ),
          //         // ),
          //       )
          //     ];
          //   },
          //   body: Container(),
          // ),
        );
      }
    );
  }

}