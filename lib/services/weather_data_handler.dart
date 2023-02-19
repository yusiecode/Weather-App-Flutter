import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData
{
  final String url;
  WeatherData({required this.url});
  Future getData()
  async {
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200)
      {
        var data = response.body;
        return jsonDecode(data);
      }
    else
      {
        print(response.statusCode);
      }
  }
}