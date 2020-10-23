import 'dart:io';
import 'dart:convert';

class GetMeteo {
  String city;

  GetMeteo(this.city);

  dynamic meteo() async {
    var u =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=PUTYOURAPPIDHERE";
    var url = Uri.parse(u);
    HttpClient client = new HttpClient();

    HttpClientRequest request = await client.postUrl(url);

    var payload = {'title': 'Dart weather'};
    request.write(json.encode(payload));

    HttpClientResponse response = await request.close();

    var stream = response.transform(Utf8Decoder());
    await for (var data in stream) {
      Map<String, dynamic> weather = jsonDecode(data.toString());
      if (response.statusCode == 200) {
        print("La température à $city est de " +
            weather['main']['temp'].toString() +
            "°C");
      } else {
        print("Une erreur s'est produite. Vérifiez que la ville existe.");
      }
    }
  }
}
