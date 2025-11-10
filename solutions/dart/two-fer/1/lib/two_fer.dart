String twoFer([String name ='']) {
  // Replace the throw call and put your code here
  name = name.trim();
  return name.isEmpty ? 'One for you, one for me.' : 'One for $name, one for me.';
  
}
