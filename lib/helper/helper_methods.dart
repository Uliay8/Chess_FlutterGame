bool isWhite(int index) {
  bool isWhite = false;
  if (index % 2 == 0 && ((index ~/ 8) % 2 == 0) ||
      index % 2 == 1 && ((index ~/ 8) % 2 == 1)) {
    isWhite = true;
  }
  return isWhite;
}
