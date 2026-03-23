void main() {
  String fileContent = '''
apple banana apple orange
cat dog cat cat bird
sun moon sun star moon sun
''';

  List<String> lines = fileContent.trim().split('\n');

  int globalMaxFrequency = 0;
  List<Map<String, dynamic>> results = [];

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];

    List<String> words = line.toLowerCase().split(' ');

    Map<String, int> frequency = {};

    for (var word in words) {
      if (word.isEmpty) continue;
      frequency[word] = (frequency[word] ?? 0) + 1;
    }

    int maxFreq = frequency.values.reduce((a, b) => a > b ? a : b);

    List<String> maxWords = [];
    frequency.forEach((word, count) {
      if (count == maxFreq) {
        maxWords.add(word);
      }
    });

    results.add({
      'line': i + 1,
      'words': maxWords,
      'frequency': maxFreq
    });

    if (maxFreq > globalMaxFrequency) {
      globalMaxFrequency = maxFreq;
    }
  }

  print("The following words have the highest word frequency per line:\n");

  for (var result in results) {
    if (result['frequency'] == globalMaxFrequency) {
      print("${result['words']} (appears in line ${result['line']})");
    }
  }
}
