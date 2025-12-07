class SpaceAge {
  // Put your code here
  // Abdel_Abbo
  double age({required String planet, required int seconds}) {
    final Map<String, double> planetAnnumMap = {
      'Mercury': 0.2408467,
      'Venus': 0.61519726,
      'Earth': 1.0,
      'Mars': 1.8808158,
      'Jupiter': 11.862615,
      'Saturn': 29.447498,
      'Uranus': 84.016846,
      'Neptune': 164.79132,
    };
    final double years = seconds / (planetAnnumMap[planet]! * 31557600);

    return double.parse(years.toStringAsFixed(2));
  }
}
