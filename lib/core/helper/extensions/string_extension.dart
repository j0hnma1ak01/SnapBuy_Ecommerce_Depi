extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";

  String getFirstTwoWords(name) {
    List<String> words = name.split(' ');
    if (words.length <= 2) {
      return name;
    }
    return '${words[0]} ${words[1]}';
  }
}
