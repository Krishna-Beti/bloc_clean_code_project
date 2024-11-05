import 'package:bloc_clean_code_project/config/app_urls.dart';
import 'package:bloc_clean_code_project/config/data/network/network_api_services.dart';
import 'package:bloc_clean_code_project/models/movies/movies.dart';
import 'package:bloc_clean_code_project/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  
  final _apiServices = NetworkApiServices();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrls.moviesApi);
    return MoviesModel.fromJson(response);
  }
  
  
  
}