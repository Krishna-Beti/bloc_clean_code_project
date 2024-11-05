import 'package:bloc_clean_code_project/bloc/movies/movies_bloc.dart';
import 'package:bloc_clean_code_project/config/routes/routes_name.dart';
import 'package:bloc_clean_code_project/main.dart';
import 'package:bloc_clean_code_project/services/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MoviesBloc moviesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: BlocProvider(
        create: (context) => moviesBloc..add(MoviesFetchedEvent()),
        child: BlocBuilder<MoviesBloc, MoviesStates>(
          builder: (context, state) {
            switch(state.moviesList.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator(),);
              case Status.error:
                return Center(child: Text("${state.moviesList.message}"),);
              case Status.completed:
                 if(state.moviesList.data == null) {
                   return const Center(child: Text("No Data found"),);
                 }
                 final movieList = state.moviesList.data;
                 return ListView.builder(
                   itemCount: movieList!.tvShow.length,
                   itemBuilder: (context, index) {
                     final tvShow = movieList.tvShow[index];
                     return Card(
                       child: ListTile(
                         leading: CircleAvatar(
                           foregroundImage: NetworkImage(tvShow.imageThumbnailPath),
                         ),
                         title: Text(tvShow.name.toString()),
                         subtitle: Text(tvShow.network.toString()),
                         trailing: Text(tvShow.status.toString()),
                       ),
                     );
                   },
                 );
              case null:
                return const Center(child: Text("No Data found due to some technical issues"),);
            }
          },
        ),
      ),
    );
  }
}
