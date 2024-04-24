import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midterms/db/movies.dart';
import 'package:midterms/model/movie.dart';
// import 'package:todoapp/page/edit_note_page.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late Movie movie;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMovie();
  }

  Future refreshMovie() async {
    setState(() => isLoading = true);

    movie = await MoviesDatabase.instance.readMovie(widget.movieId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [editButton(), deleteButton()],
    ),
    body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            movie.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat.yMMMd().format(movie.releaseTime),
            style: const TextStyle(color: Colors.white38, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            movie.description,
            style:
            const TextStyle(color: Colors.white70, fontSize: 18),
          )
        ],
      ),
    ),
  );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined, color: Colors.black,),
      onPressed: () async {
        if (isLoading) return;

        // await Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => AddEditNotePage(movie: movie),
        // ));

        refreshMovie();
      });

  Widget deleteButton() => IconButton(
    icon: const Icon(Icons.delete, color: Colors.black,),
    onPressed: () async {
      await MoviesDatabase.instance.delete(widget.movieId);

      if(mounted) {
        Navigator.of(context).pop();
      }
    },
  );
}