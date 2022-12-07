
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Movies Search";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _emptyContainer();
  }

  Widget _emptyContainer(){

    return const SizedBox(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 150,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(query.isEmpty){
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {

        if(!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieSuggestionItem(movie: movies[index], indexId: '${movies[index].title}-$index-${movies[index].id}-${movies[index].genreIds}')
        );
      }
    );

  }
   
}

class _MovieSuggestionItem extends StatelessWidget {

  final Movie movie;
  final String indexId;

  const _MovieSuggestionItem({super.key, required this.movie, required this.indexId});

  @override
  Widget build(BuildContext context) {
    movie.heroId = indexId.toString();
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage("assets/no-image.jpg"), 
          image: NetworkImage(movie.fullPosterImg),
          width: 100,
          fit: BoxFit.cover
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      trailing: Text(movie.voteAverage.toString()),
      onTap: (){
        Navigator.pushNamed(context, "details", arguments: movie);
      },
    );
  }
}