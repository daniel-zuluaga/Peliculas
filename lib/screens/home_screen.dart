import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en cines"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: (() {}), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Tarjetas Principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Slider de peliculas 
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: "Populares",
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),

          ],

        )

        //Listado horizontal de peliculas

      ),
    );
  }
}