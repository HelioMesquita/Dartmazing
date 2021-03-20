import 'package:dartmazing/Scenes/RepositoriesList/Page/cubit/repositories_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoriesListPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesListCubit, RepositoriesListState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: CupertinoNavigationBar(),
          body: Container()
        );
      }
    );
  }

}