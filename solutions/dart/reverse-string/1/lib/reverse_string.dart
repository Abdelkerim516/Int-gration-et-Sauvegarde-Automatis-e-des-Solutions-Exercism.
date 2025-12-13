String reverse(String input) {
  List<String> temp = input.split('');
  List<String> out = [''];
  for (var i = temp.length - 1; i >= 0; i--) out.add(temp[i]);
  return out.join();
}
