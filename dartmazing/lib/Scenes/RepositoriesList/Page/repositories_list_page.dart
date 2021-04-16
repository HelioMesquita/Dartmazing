import 'package:dartmazing/Components/RepositoriesListCell/repositories_list_cell.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/Routes/routes.dart';
import 'package:dartmazing/Scenes/RepositoriesList/Page/cubit/repositories_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartmazing/Models/repositories_type.dart';

class RepositoriesListPage extends StatefulWidget {

  @override
  _RepositoriesListPageState createState() => _RepositoriesListPageState();
}

class _RepositoriesListPageState extends State<RepositoriesListPage> {

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        BlocProvider.of<RepositoriesListCubit>(context).getRepositories();
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesListCubit, RepositoriesListState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: CupertinoNavigationBar(
            backgroundColor: Theme.of(context).backgroundColor,
            middle: Text(
              getFilterTitle(state.type),
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6.color,
              )
            )
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 24, right: 24),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.repositories.length,
              itemBuilder: (context, index) {
               return RepositoriesListCell(repository: state.repositories[index], repositoryTap: (repository) {
                  _presentDetail(repository, context);
                });
              }
            )
          )
        );
      }
    ); 
  }

  _presentDetail(Repository repository, BuildContext context) {
    Navigator.of(context).pushNamed(Routes.Detail, arguments: repository);
  }

}
