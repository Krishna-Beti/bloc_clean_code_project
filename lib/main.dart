import 'package:bloc_clean_code_project/config/routes/routes_name.dart';
import 'package:bloc_clean_code_project/repository/auth/login_repository.dart';
import 'package:bloc_clean_code_project/repository/movies/movies_http_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'config/routes/routes.dart';


GetIt getIt = GetIt.instance;

void main() {
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
    );
  }
}



void servicesLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(),);
  getIt.registerLazySingleton<MoviesHttpApiRepository>(() => MoviesHttpApiRepository(),);
}