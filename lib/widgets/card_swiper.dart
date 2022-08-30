import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {

final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details", arguments: "movie-Batman"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"), 
                image: NetworkImage("https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/01/batman-michael-keaton.jpg?fit=1200%2C945&quality=50&strip=all&ssl=1"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}


