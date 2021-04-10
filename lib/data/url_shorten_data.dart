import 'package:http/http.dart' as http;
import 'package:url_shorten_app/model/url_shorten_model.dart';

// Future<String> getShortLink(String longUrl) async {
//   final result = await http.post(
//       Uri.parse("https://cleanuri.com/api/v1/shorten"),
//       body: {"url": longUrl});

//   if (result.statusCode == 200) {
//     print("Succesfully Completed");

//     final response = urlResultFromJson(result.body);
//     print(result.body);

//     return response.resultUrl;
//   } else {
//     print("Error in Api");
//     print(result.body);
//     return "There is some in shortening the url";
//   }
// }

class UrlResult {
  static Future<String> urlShorten(String loadurl) async {
    var uri = Uri.parse('https://cleanuri.com/api/v1/shorten');

    http.Response response = await http.post(
      uri,
      body: {"url": loadurl},
    );
    print(response.body);
    try {
      if (response.statusCode == 200) {
        final urlResult = urlResultFromJson(response.body);
        return urlResult.resultUrl;
      } else {
        throw 'data not found';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
