import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:dartmazing/Extensions/int_kilo_format.dart';
import 'package:intl/intl.dart';

class DetailViewModel {
  String name;
  String author;
  String imageURL;
  String description;
  String stars;
  String issues;
  String forks;
  String lastUpdate;

  DetailViewModel(Repository repository) {
    this.name = repository.name;
    this.author = repository.author;
    this.imageURL = repository.imageURL;
    this.description = repository.description ?? "";
    this.stars = "- ${repository.stars.kiloFormat} ${S.current.stars}";
    this.issues = "- ${repository.issues.kiloFormat} ${S.current.issues}";
    this.forks = "- ${repository.forks.kiloFormat} ${S.current.forks}";
    this.lastUpdate = "- ${S.current.lastUpdate} ${DateFormat("dd/MM/yyyy").format(DateTime.parse(repository.lastUpdate))}";
  }

}