import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpAdmin {
  HttpAdmin();

  void pedirTiempoEn(double lat, double lon) async {
    var url = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': lat.toString(),
      'longitude': lon.toString(),
      'hourly': 'temperature_2m'
    });
    print("URL: " + url.toString());
    var response = await http.get(url);
  }
}
