// weather animations
String getWeatherAnimation(String? mainCondition) {
  //mainCondition = 'rain';
  if (mainCondition == null) return 'sun.png';

  switch (mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'cloud.png';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'rain.png';
    case 'thunderstorm':
      return 'storm.png';
    case 'clear':
      return 'sun.png';
    default:
      return 'sun.png';
  }
}
