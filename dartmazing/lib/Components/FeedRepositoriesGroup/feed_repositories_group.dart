import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group_view_model.dart';
import 'package:dartmazing/Components/FeedRepositoryCell/feed_repository_cell.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:flutter/material.dart';

class FeedRepositoriesGroup extends StatelessWidget {

  final FeedRepositoriesGroupViewModel group;
  final Function(Repository) repositoryTap;

  FeedRepositoriesGroup({Key key, this.group, this.repositoryTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeedRepositoryCell(repository: group.firstCell, repositoryTap: repositoryTap),
        _cellWithDivider(context, group.secondCell),
        _cellWithDivider(context, group.thirdCell),
      ],
    );
  }

  Widget _cellWithDivider(BuildContext context, Repository repository) {
    return Visibility(
      visible: repository != null,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 86.0),
            child: Divider(color: Theme.of(context).shadowColor, thickness: 0.5,),
          ),
          FeedRepositoryCell(repository: repository, repositoryTap: repositoryTap)
        ],
      ),
    );
  }

}