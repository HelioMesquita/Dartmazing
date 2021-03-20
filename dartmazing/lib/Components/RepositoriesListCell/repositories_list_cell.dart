import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dartmazing/Extensions/int_kilo_format.dart';

class RepositoriesListCell extends StatelessWidget {

  final borderRadius = BorderRadius.circular(14);
  final Repository repository;
  final Function(Repository) repositoryTap;
  
  RepositoriesListCell({Key key, @required this.repository, @required this.repositoryTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              _image(context),
              SizedBox(width: 12),
              _headerText(context)
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Divider(color: Theme.of(context).shadowColor, thickness: 0.5),
          ),
        ],
      ),
      onTap: () => repositoryTap(this.repository),
    );
  }
  

  Widget _image(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          width: 1,
          color: Theme.of(context).shadowColor
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.network(
          repository.imageURL,
          width: 90,
          height: 90,
        )
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repository.name,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline6.color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.3
          ),
        ),
        Text(
          repository.description,
          maxLines: 2,
          softWrap: true,
          style: TextStyle(
            color: Theme.of(context).textTheme.subtitle2.color,
            fontSize: 16,
            letterSpacing: -0.3
          ),
        ),
        SizedBox(height: 25),
        _starsRow(context)
      ]
    );
  }

  Widget _starsRow(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor,
            borderRadius: borderRadius,
          ),
          child: Text(
            repository.stars.kiloFormat,
            style: TextStyle(
              backgroundColor: Theme.of(context).shadowColor,
              color: Theme.of(context).textTheme.button.color,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.3
            ),
          ),
        ),
        SizedBox(width: 4),
        Text(
          S.of(context).stars,
          style: TextStyle(
            color: Theme.of(context).textTheme.subtitle2.color,
            fontSize: 16,
          ),
        ),
        

      ]
    );
  }

}
