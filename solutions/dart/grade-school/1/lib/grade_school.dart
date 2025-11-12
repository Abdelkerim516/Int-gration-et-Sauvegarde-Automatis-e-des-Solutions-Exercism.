class GradeSchool {
  final Map<int, Set<String>> _roster = {};

  // lis of name is here
  List<bool> add(List<(String, int)> students) {
    final result = <bool>[];

    for (final (name, grade) in students) {

      if (_roster.values.any((s)=> s.contains(name))) {
        result.add(false);

        continue;
      }

      _roster.putIfAbsent(grade, () => <String> {});
      _roster[grade]!.add(name);
      result.add(true);
    }

    return result;
  }
  List<String> grade(int grade) {
    final students = _roster[grade];
    if (students == null) return [];
    return students.toList()..sort();
  }

  List<String> roster() {
    final sorted = <String>[];
    final grades = _roster.keys.toList()..sort();
    for(final g in grades) {
      final students = _roster[g]!.toList()..sort();
      sorted.addAll(students);
      
    }
    return sorted;
  }
}
