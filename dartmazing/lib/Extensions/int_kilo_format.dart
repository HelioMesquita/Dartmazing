extension KiloFormat on int {

  String get kiloFormat {
    if (this >= 1000) {
        var result = "";
        final remainder = (this ~/ 1000);
        result += remainder.toString();

        final quotient = (this % 1000);
        final remainderQuotient = (quotient ~/ 100);

        if (remainderQuotient > 0) {
            result += ".${remainderQuotient}k";
        } else {
            result += "k";
        }
        return result;
    } else {
      return this.toString();
    }
  }

}