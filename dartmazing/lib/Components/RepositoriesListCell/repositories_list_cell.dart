import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dartmazing/Extensions/int_kilo_format.dart';

class RepositoriesListCell extends StatelessWidget {

  final double imageHeight = 90;
  final borderRadius = BorderRadius.circular(14);
  final Repository repository;
  final Function(Repository) repositoryTap;
  
  RepositoriesListCell({Key key, @required this.repository, @required this.repositoryTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Table(
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          TableRow(
            children: [
              _image(context),
              SizedBox(width: 12),
              _headerText(context)
            ]
          ),
          TableRow(
            children: [
              SizedBox(),
              SizedBox(),
              Divider(color: Theme.of(context).shadowColor, thickness: 0.5),
            ]
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
          height: imageHeight,
        )
      ),
    );
  }

  Widget _headerText(BuildContext context) {
    return Container(
      height: imageHeight,
      child: Column(
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
            repository.description ?? "",
            maxLines: 2,
            style: TextStyle(
              color: Theme.of(context).textTheme.subtitle2.color,
              fontSize: 12,
              letterSpacing: -0.3
            ),
          ),
          Flexible(
            child: Container()
          ),
          _starsRow(context)
        ]
      ),
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
