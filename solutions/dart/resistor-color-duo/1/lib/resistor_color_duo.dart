class ResistorColorDuo {
  // Abdel_Abbo
    var colors = [
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
  int value(List<String> color){
    return ( (colors.indexOf(color[0])*10) + colors.indexOf(color[1]));
  }
}
