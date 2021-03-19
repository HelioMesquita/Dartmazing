import 'package:dartmazing/Components/FeedNewsCell/feed_news_cell_view_model.dart';
import 'package:dartmazing/Models/repository.dart';
import 'package:flutter/material.dart';

class FeedNewsCell extends StatelessWidget {

  final borderRadius = BorderRadius.circular(6);
  final FeedNewsCellViewModel viewModel;

  FeedNewsCell({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topDivider(context),
        _header(context),
        SizedBox(height: 8),
        generateGridImage(context),
        SizedBox(height: 20)
      ],
    );
  }

  Widget _topDivider(BuildContext context) {
    return Divider(color: Theme.of(context).shadowColor, thickness: 0.5,);
  }

  Widget _header(BuildContext context) {
    return Column(
      children: <Widget>[
        _title(context),
        _description(context),
        _subtitle(context),
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        viewModel.title,
        style: TextStyle(
          color: Theme.of(context).textTheme.button.color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3
        ),
      ),
    );
  }

  Widget _subtitle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        viewModel.subtitle,
        style: TextStyle(
          color: Theme.of(context).textTheme.subtitle2.color,
          fontSize: 24,
          letterSpacing: -0.3
        ),
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        viewModel.description,
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6.color,
          fontSize: 24,
          letterSpacing: -0.3
        ),
      ),
    );
  }
  
  Widget generateGridImage(BuildContext context) {
    return Container(
      height: 220,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: generateTable()
      ),
    );
  }

  Table generateTable() {
    return Table(
      children: [
        TableRow(children: generateRown(viewModel.evenList)),
        TableRow(children: generateRown(viewModel.oddList))
      ],
    );
  }

  List<Widget> generateRown(List<Repository> list) {
    return list.map((e) => Image.network(e.imageURL, height: 110, fit: BoxFit.cover)).toList();
  }

}