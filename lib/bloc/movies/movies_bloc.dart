import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code_project/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';

import '../../config/data/response/api_response.dart';
import '../../models/movies/movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {

  MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository}) : super(MoviesStates(moviesList: ApiResponse.loading())){
    on<MoviesFetchedEvent>(_fetchMoviesEvent);
  }

  Future<void> _fetchMoviesEvent(MoviesFetchedEvent event, Emitter<MoviesStates> emit) async {
    await moviesRepository.fetchMoviesList().then((value) {
      emit(state.copyWith(moviesList: ApiResponse.completed(value)));
    },).onError((error, stackTrace) {
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
    },);
  }
}