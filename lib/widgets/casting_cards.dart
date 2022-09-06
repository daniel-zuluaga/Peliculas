
import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ( _ , index) => const _CastCard(),
      ),
    );
  }
}


class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"), 
              image: NetworkImage("https://i.pinimg.com/236x/87/97/d5/8797d54b7d11ae951380e571a12ae368.jpg"),
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),

          const Text(
            "actors.name abJBAHJBSABAS<IDBA DABDHABDUAW SAU",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),

    );
  }
}

