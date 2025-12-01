class Forth {
  // Abdel_abbo
  /// List of integer hold on the stack.
  List<int> stack = [];
  /// Collection of user defined words and their corresponding values.
  Map<String, String> userDefinedWords = {};
  /// Char indicating the start of a user defined operation.
  final String userDefinedWordPrefix = ':';
  /// Char indicating the end of a user defined operation.
  final String userDefinedWordSuffix = ';';
  /// Evaluates a string and executes the operations contained in it.
  void evaluate(String expression) {
    bool recordMode = false;
    var recordedExpression = '';
    final expressions = expression.toLowerCase().split(' ');
    expressions.forEach((expression) {
      if (recordMode) {
        if (expression == userDefinedWordSuffix) {
          recordUserDefinedOperation(recordedExpression);
          recordMode = false;
        } else {
          recordedExpression += ' $expression';
        }
      } else {
        if (expression == userDefinedWordPrefix) {
          recordMode = true;
          recordedExpression = '';
        } else {
          evaluateExpression(expression);
        }
      }
    });
  }
  /// Saves the user defined operation on the [userDefinedWords] collection.
  void recordUserDefinedOperation(String recordedExpression) {
    final expressions = recordedExpression.trim().split(' ');
    var command = '';
    var commandValue = '';
    expressions.forEach((expression) {
      if (command == '') {
        if (isAnInt(expression)) {
          throw Exception('Invalid definition');
        }
        command = expression;
      } else {
        var value = expression;
        if (isUserDefined(expression)) {
          value = userDefinedWords[expression] ?? '';
        }
        commandValue += ' $value';
      }
    });
    userDefinedWords[command] = commandValue.trim();
  }
  /// Evaluates an expression and adds it to the stack if its a number or
  /// execute it if it's an operation.
  void evaluateExpression(String expression) {
    if (isAnInt(expression)) {
      stack.add(int.parse(expression));
    } else if (isUserDefined(expression)) {
      executeUserDefinedOperation(expression);
    } else {
      executeBasicOperation(expression);
    }
  }
  /// Whether a string is an valid integer.
  bool isAnInt(String expression) => int.tryParse(expression) != null;
  /// Returns whether a string matches a user-defined operation.
  bool isUserDefined(String operation) =>
      userDefinedWords.containsKey(operation);
  /// Executes a basic operation
  ///
  /// Throws an [Exception] if the operation isn't defined.
  void executeBasicOperation(String operation) {
    switch (operation) {
      case '+':
        addition();
        break;
      case '-':
        substraction();
        break;
      case '*':
        multiplication();
        break;
      case '/':
        division();
        break;
      case 'dup':
        duplicate();
        break;
      case 'drop':
        drop();
        break;
      case 'swap':
        swap();
        break;
      case 'over':
        over();
        break;
      default:
        throw Exception('Unknown command');
    }
  }
  /// Executes a user-defined operation.
  void executeUserDefinedOperation(String operation) =>
      evaluate(userDefinedWords[operation] ?? '');
  /// Reduces the stack to a single value using the provided combine function.
  ///
  /// Throws an exception if the stack has less than 2 values.
  void reduceStack(int Function(int, int) combine) {
    if (stack.length < 2) {
      throw Exception('Stack empty');
    }
    final value = stack.reduce(combine);
    stack = [value];
  }
  /// Adds the values of the stack.
  ///
  /// Throws an [Exception] when the stack contains less than 2 values.
  void addition() => reduceStack((value, element) => value + element);
  /// Substracts the values of the stack.
  ///
  /// Throws an [Exception] when the stack contains less than 2 values.
  void substraction() => reduceStack((value, element) => value - element);
  /// Multiply the values of the stack.
  ///
  /// Throws an [Exception] when the stack contains less than 2 values.
  void multiplication() => reduceStack((value, element) => value * element);
  /// Multiply the values of the stack.
  ///
  /// Throws an [Exception] when:
  ///   - The stack contains less than 2 values.
  ///   - The denominator is a zero.
  void division() {
    if (stack.length < 2) {
      throw Exception('Stack empty');
    }
    if (stack[1] == 0) {
      throw Exception('Division by zero');
    }
    reduceStack((value, element) => value ~/ element);
  }
  /// Adds to the stack a value equal to the last added.
  ///
  /// Throws an [Exception] if the stack is empty.
  void duplicate() {
    if (stack.isEmpty) throw Exception('Stack empty');
    stack.add(stack.last);
  }
  /// Removes the last value from the stack.
  ///
  /// Throws an [Exception] if the stack is empty.
  void drop() {
    if (stack.isEmpty) throw Exception('Stack empty');
    stack.removeLast();
  }
  /// Changes the position of the last value an the one before it.
  ///
  /// Throws an [Exception] when:
  ///   - The stack is empty.
  ///   - The stack contains less than 2 values.
  void swap() {
    if (stack.isEmpty) throw Exception('Stack empty');
    if (stack.length < 2) throw Exception('Stack empty');
    final oldLast = stack.last;
    final newLast = stack[stack.length - 2];
    stack[stack.length - 1] = newLast;
    stack[stack.length - 2] = oldLast;
  }
  /// Adds to the stack a new value matching the second to last of the stack.
  ///
  /// Throws an [Exception] when:
  ///   - The stack is empty.
  ///   - The stack contains less than 2 values.
  void over() {
    if (stack.isEmpty) throw Exception('Stack empty');
    if (stack.length < 2) throw Exception('Stack empty');
    stack.add(stack[stack.length - 2]);
  }
}

