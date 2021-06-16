
String splitName(String fullName) {
  if (fullName != null) {
    final splitName = fullName.trim().split(" ");
    if (splitName.length > 1)
      return "${capitalizeFirstLetter(splitName[0])} ${capitalizeFirstLetter(splitName[1])}";
    else
      return capitalizeFirstLetter(splitName[0]);
  }
  return "";
}

String capitalizeFirstLetter(String someString) {
  if (someString != null && someString.length > 0)
    return someString[0].toUpperCase() + someString.substring(1).toLowerCase();
  return "";
}