import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dartmazing/Extensions/int_kilo_format.dart';

class FeedRepositoryCell extends StatelessWidget {
  final borderRadius = BorderRadius.circular(14);
  final Repository repository;
  final Function(Repository) repositoryTap;

  FeedRepositoryCell({
    Key? key,
    required this.repository,
    required this.repositoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Row(children: [
          _imageProfile(context),
          SizedBox(width: 12),
          _repositoryFields(context),
          _startsFields(context)
        ]),
      ),
      onTap: () => repositoryTap(this.repository),
    );
  }

  Widget _imageProfile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(width: 1, color: Theme.of(context).shadowColor),
      ),
      child: ClipRRect(
          borderRadius: borderRadius,
          child: Image.network(
            repository.imageURL,
            width: 62.0,
            height: 62.0,
          )),
    );
  }

  Widget _repositoryFields(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repository.name,
            maxLines: 1,
            style: TextStyle(
              color: Theme.of(context).textTheme.headline6?.color,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 4),
          Text(
            repository.author,
            maxLines: 2,
            style: TextStyle(
              color: Theme.of(context).textTheme.subtitle2?.color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _startsFields(BuildContext context) {
    return Column(children: [
      Container(
        height: 28,
        width: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            repository.stars.kiloFormat,
            style: TextStyle(
                backgroundColor: Theme.of(context).shadowColor,
                color: Theme.of(context).textTheme.button?.color,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(height: 2),
      Text(
        S.of(context).stars,
        style: TextStyle(
          color: Theme.of(context).textTheme.subtitle2?.color,
          fontSize: 11,
        ),
      ),
    ]);
  }
}
