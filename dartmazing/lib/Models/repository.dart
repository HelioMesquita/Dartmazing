class Repository {
  final String name;
  final String author;
  final int stars;
  final String imageURL;

  Repository({this.name, this.author, this.stars, this.imageURL});

  String get starsKiloFormat {
    if (stars >= 1000) {
        var result = "";
        final remainder = (stars ~/ 1000);
        result += remainder.toString();

        final quotient = (stars % 1000);
        final remainderQuotient = (quotient ~/ 100);

        if (remainderQuotient > 0) {
            result += ".${remainderQuotient}k";
        } else {
            result += "k";
        }
        return result;
    } else {
      return stars.toString();
    }
  }

}