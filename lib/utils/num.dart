extension FormatNum on num {
  String formatAmount() {
    if (this % 1 == 0) {
      return toInt().toString();
    }
    return toString();
  }
}
