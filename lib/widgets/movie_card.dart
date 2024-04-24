import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/movie.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    Key? key,
    required this.movie,
    required this.index,
  }) : super(key: key);

  final Movie movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = Colors.lightBlue;
    final rTime = DateFormat.yMMMd().format(movie.releaseTime);
    final eTime = DateFormat.yMMMd().format(movie.endTime);
    double poster_scale = 5;
    // final minHeight = 100;

    return Card(
      color: color,
      child: Container(
        constraints: const BoxConstraints(minHeight: 250),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(
                image: NetworkImage(movie.posterUrl
                )
            ),
            Text(
              "${movie.director}",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              "$rTime - $eTime",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
