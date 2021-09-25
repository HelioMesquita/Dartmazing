import 'package:dartmazing/Components/FeedRepositoriesGroup/feed_repositories_group_view_model.dart';
import 'package:dartmazing/Components/FeedRepositoryCell/feed_repository_cell.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:flutter/material.dart';

class FeedRepositoriesGroup extends StatelessWidget {
  final FeedRepositoriesGroupViewModel group;
  final Function(Repository) repositoryTap;

  FeedRepositoriesGroup({
    Key? key,
    required this.group,
    required this.repositoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cell(context, group.firstCell, false),
        _cell(context, group.secondCell, true),
        _cell(context, group.thirdCell, true),
      ],
    );
  }

  Widget _cell(BuildContext context, Repository? repository, bool hasDivider) {
    if (repository == null) return Container();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 75.0),
          child: Visibility(
            visible: hasDivider,
            child: Divider(
              color: Theme.of(context).shadowColor,
              thickness: 0.5,
            ),
          ),
        ),
        FeedRepositoryCell(repository: repository, repositoryTap: repositoryTap)
      ],
    );
  }
}
