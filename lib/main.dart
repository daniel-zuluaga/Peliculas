import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';

import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';


void main() => runApp(AppState());


class AppState extends StatelessWidget {
  // const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: "splash_home",
      routes: {
        "splash_home": (_) => SplashHome(),
        "home": (_) =>  HomeScreen(),
        "details": (_) =>  DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        )
      ),
      
    );
  }
}