import 'package:dartmazing/Models/repository.dart';
import 'package:dartmazing/generated/l10n.dart';
import 'package:dartmazing/Extensions/int_kilo_format.dart';
import 'package:intl/intl.dart';

class DetailViewModel {
  String name;
  String author;
  String imageURL;
  String? description;
  String stars;
  String issues;
  String forks;
  String lastUpdate;

  DetailViewModel({
    required this.name,
    required this.author,
    required this.imageURL,
    required this.description,
    required this.stars,
    required this.issues,
    required this.forks,
    required this.lastUpdate,
  });

  factory DetailViewModel.fromRepository(Repository repository) {
    return DetailViewModel(
      name: repository.name,
      author: repository.author,
      imageURL: repository.imageURL,
      description: repository.description,
      stars: "- ${repository.stars.kiloFormat} ${S.current.stars}",
      issues: "- ${repository.issues.kiloFormat} ${S.current.issues}",
      forks: "- ${repository.forks.kiloFormat} ${S.current.forks}",
      lastUpdate:
          "- ${S.current.lastUpdate} ${DateFormat("dd/MM/yyyy").format(DateTime.parse(repository.lastUpdate))}",
    );
  }
}
