library two_bucket;
typedef Result = ({int moves, String goalBucket, int otherBucket});
class TwoBucket {
  final int bucketOne;
  final int bucketTwo;
  final int goal;
  final String startBucket;
  TwoBucket({
    required this.bucketOne,
    required this.bucketTwo,
    required this.goal,
    required this.startBucket,
  });
  Result measure() {
    if (goal > bucketOne && goal > bucketTwo) {
      throw ArgumentError("impossible");
    }
    if (goal % _gcd(bucketOne, bucketTwo) != 0) {
      throw ArgumentError("impossible");
    }
    // bucket one and bucket two
    final resultFromStart = _simulate(startBucket == "one");
    final resultFromOther = _simulate(startBucket != "one");
    if (resultFromStart != null) return resultFromStart;
    if (resultFromOther != null) return resultFromOther;
    throw ArgumentError("impossible");
  }
  Result? _simulate(bool startWithOne) {
    final fromCap = startWithOne ? bucketOne : bucketTwo;
    final toCap = startWithOne ? bucketTwo : bucketOne;
    final fromName = startWithOne ? "one" : "two";
    final toName = startWithOne ? "two" : "one";
    final visited = <String>{};
    final queue = <(int, int, int)>[];
    //  starting bucket
    queue.add((fromCap, 0, 1)); 
    while (queue.isNotEmpty) {
      final (from, to, moves) = queue.removeAt(0);
      final stateKey = "$from,$to";
      if (visited.contains(stateKey)) continue;
      visited.add(stateKey);
      if (from == goal) {
        return (
          moves: moves,
          goalBucket: fromName,
          otherBucket: to
        );
      }
      if (to == goal) {
        return (
          moves: moves,
          goalBucket: toName,
          otherBucket: from
        );
      }
     
      if (from == 0 && to == toCap) continue;
      
      queue.add((fromCap, to, moves + 1)); 
      queue.add((from, toCap, moves + 1)); 
      queue.add((0, to, moves + 1)); 
      queue.add((from, 0, moves + 1)); 
      // pour from -> to
      final total1 = from + to;
      final newTo1 = total1 > toCap ? toCap : total1;
      final newFrom1 = total1 - newTo1;
      queue.add((newFrom1, newTo1, moves + 1));
      // pour to -> from
      final newFrom2 = total1 > fromCap ? fromCap : total1;
      final newTo2 = total1 - newFrom2;
      queue.add((newFrom2, newTo2, moves + 1));
    }
    return null;
  }
  int _gcd(int a, int b) => b == 0 ? a : _gcd(b, a % b);
}