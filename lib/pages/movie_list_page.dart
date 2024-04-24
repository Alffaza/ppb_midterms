import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:midterms/model/movie.dart';
import 'package:midterms/db/movies.dart';
import 'package:midterms/pages/edit_movie_page.dart';
import 'package:midterms/pages/movie_detail_page.dart';
import 'package:midterms/widgets/movie_card.dart';
// import 'package:todoapp/db/notes_db.dart';
// import 'package:todoapp/model/note.dart';
// import 'package:todoapp/page/edit_note_page.dart';
// import 'package:todoapp/page/note_detail_page.dart';
// import 'package:todoapp/widget/note_card_widget.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListState();
}

class _MovieListState extends State<MovieListPage> {
  late List<Movie> movies;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshMovies();
  }

  @override
  void dispose() {
    MoviesDatabase.instance.close();

    super.dispose();
  }

  Future refreshMovies() async {
    setState(() => isLoading = true);

    movies = await MoviesDatabase.instance.readAllMovies();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
      title: const Text(
        'Notes',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
      ),
          ),
          body:
          Container(
            color: Colors.blueAccent,
            child: Center(
                  child: isLoading
            ? const CircularProgressIndicator()
            : movies.isEmpty
            ? const Text(
                    'No Movies',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
            : buildMovies(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white60,
      ),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditMoviePage()),
        );

        refreshMovies();
      },
          ),
        );
  Widget buildMovies() => StaggeredGrid.count(
    // itemCount: notes.length,
    // staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(
        movies.length,
            (index) {
          final movie = movies[index];

          return StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movieId: movie.id!),
                ));

                refreshMovies();
              },
              child: MovieCardWidget(movie: movie, index: index),
            ),
          );
        },
      ));
}
