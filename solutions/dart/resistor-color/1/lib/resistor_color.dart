class ResistorColor {
  final colors = <String>[
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ];
  int colorCode(String color) {
    return colors.indexOf(color);
  }
}
