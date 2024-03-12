import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpAdmin {
  HttpAdmin();

  Future<double> pedirTiempoEn(double lat, double lon) async {
    double temperatura = 0;
    var url = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': lat.toString(),
      'longitude': lon.toString(),
      'hourly': 'temperature_2m'
    });
    var response = await http.get(url);

    if(response.statusCode==200){
      var jsonResponse = convert.jsonDecode(response.body)as Map<String,dynamic>;
    temperatura = jsonResponse['hourly']['temperature_2m'][DateTime.now().hour];
    }
    print(temperatura);
    return temperatura;
  }
}
