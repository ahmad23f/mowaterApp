String extractFirstName(String fullName) {
  List<String> name;
  name = fullName.split(' ');
  return name.first;
}
