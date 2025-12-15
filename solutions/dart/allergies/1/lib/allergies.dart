class Allergies {
  // Put your code here
  Map<String, int> scoreData = {
    "eggs": 1,
    "peanuts": 2,
    "shellfish": 4,
    "strawberries": 8,
    "tomatoes": 16,
    "chocolate": 32,
    "pollen": 64,
    "cats": 128
  };
  bool allergicTo(String allergiesMapKey, int score) =>
      score & scoreData[allergiesMapKey]! > 0;
  List<String> list(int score) =>
      scoreData.keys.where((key) => allergicTo(key, score)).toList();
}
