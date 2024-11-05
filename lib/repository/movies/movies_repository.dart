import 'package:bloc_clean_code_project/models/movies/movies.dart';

abstract class MoviesRepository {

  Future<MoviesModel> fetchMoviesList();

}