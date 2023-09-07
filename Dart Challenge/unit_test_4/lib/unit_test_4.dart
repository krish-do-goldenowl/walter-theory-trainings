bool validatePassword(String password) {
  if (password.length < 6) {
    return false;
  }
  if (!RegExp(r'^.*[0-9]+.*$').hasMatch(password)) {
    return false;
  }
  if (!RegExp(r'^.*[a-zA-Z]+.*$').hasMatch(password)) {
    return false;
  }
  if (!RegExp(r'^.*[^a-zA-Z0-9]+.*$').hasMatch(password)) {
    return false;
  }
  return true;
}
