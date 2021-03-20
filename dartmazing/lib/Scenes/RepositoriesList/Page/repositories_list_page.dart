import 'package:dartmazing/Components/RepositoriesListCell/repositories_list_cell.dart';
import 'package:dartmazing/Models/repositories_type.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Routes/routes.dart';
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
          appBar: CupertinoNavigationBar(middle: Text(getFilterTitle(state.type))),
          body: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 24, right: 16),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return RepositoriesListCell(repository: state.repositories[index], repositoryTap: (repository) {
                  _presentDetail(repository, context);
                });
              },
            ),
          )
        );
      }
    );
  }

  _presentDetail(Repository repository, BuildContext context) {
    Navigator.of(context).pushNamed(Routes.Detail, arguments: repository);
  }

}