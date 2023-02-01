extension HelperString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String removeDash() {
    if (contains('-')) {
      return replaceAll('-', ' ');
    }
    return this;
  }
}
