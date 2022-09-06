

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey   = "cf32df06b5670bff2b44604c697e1ff9";
  String _baseUrl  = "api.themoviedb.org";
  String _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print("MoviesProvider inicializado");

    getOnDisplayMovies();
    getPopularMovies();

  }

  getOnDisplayMovies() async {
    var url =
      Uri.https(_baseUrl, '3/movie/now_playing', {
        "api_key"  : _apiKey,
        "language": _language,
        "page"    : "1"
      });

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }


  getPopularMovies() async {
    var url =
      Uri.https(_baseUrl, '3/movie/popular', {
        "api_key"  : _apiKey,
        "language": _language,
        "page"    : "1"
      });

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final popularResponce = PopularResponse.fromJson(response.body);

    popularMovies = [ ...popularMovies, ...popularResponce.results];

    notifyListeners();
  }



}


