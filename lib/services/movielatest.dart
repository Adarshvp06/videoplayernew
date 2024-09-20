import 'dart:convert';
import 'dart:developer';

import 'package:videoplayer/models/movielatest_api.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  final String apiurl = "0277cc714ad9100fe38b7f37fdfeb1d9";
  final String movieurl = "https://api.themoviedb.org/3/movie";

  Future<Movielatest> getmovielatest() async {
    var response =
        await http.get(Uri.parse("$movieurl/popular?api_key=$apiurl"));

    log(response.toString());

    if (response.statusCode == 200) {
      var respnsebody = jsonDecode(response.body);

      log(respnsebody);

      var data = Movielatest.fromJson(respnsebody);

      return data;
    } else {
      throw Exception("Movies failed to load");
    }
  }
}
