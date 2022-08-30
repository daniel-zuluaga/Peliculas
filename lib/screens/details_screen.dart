import 'package:flutter/material.dart';


class DetailsScreen extends StatelessWidget {
  // const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de la movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";


    return Scaffold(
      body: CustomScrollView(
        slivers: [
           const _CustomAppBar(),
          
          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            "movie.title",
            style: TextStyle(fontSize: 16),
            )
          ),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"), 
          image: NetworkImage("https://i.blogs.es/72ca9b/fae-4h-vkaqvsck/450_1000.webp"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"), 
              image: NetworkImage("https://imgs2.dab3games.com/fall-guys-game49.png"),
              height: 150,            
            ),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("movie.title", style: textTheme.headline5, overflow: TextOverflow.ellipsis ,maxLines: 2),
              Text("movie.originalTitle", style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),

              Row(
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.yellow,),
                  const SizedBox(width: 5),
                  Text("movie.voteAverage", style: textTheme.caption,)
                ],
              )

            ],
          ),

        ],
      ),
    );
  }
}


