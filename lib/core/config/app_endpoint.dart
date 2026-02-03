const flavorString = String.fromEnvironment('FLAVOR', defaultValue: '');
class AppEndpoint {
  static const String dev = 'https://rickandmortyapi.com/graphql';
  static const String prod = 'https://rickandmortyapi.com/graphql';

  static String getEndpoint() {
    switch (flavorString) {
      case 'dev':
        return dev;
      case 'prod':
        return prod;
      default:
        return prod;
    }
  }
}