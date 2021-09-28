import 'package:dio/dio.dart';
import 'package:firebase_demo/movies.dart';
import 'package:firebase_demo/service/environment_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  MovieService(
    this._environmentConfig,
    this._dio,
  );
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movies>> getMoviesFromAPI() async {
    print(_environmentConfig.movieApiKey);
    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=b724b45115949a0d43f0c288f1345d88&language=en-US&page=1");
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      List<Movies> movies = results
          .map((movieData) => Movies.fromMap(movieData))
          .toList(growable: true);
      return movies;
    } on DioError catch (err) {
      print("my error ==> $err");
    }
    return [];
  }
}
