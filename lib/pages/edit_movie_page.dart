import 'package:flutter/material.dart';
import 'package:midterms/db/movies.dart';
import 'package:midterms/model/movie.dart';
import 'package:midterms/widgets/movie_form.dart';

class AddEditMoviePage extends StatefulWidget {
  final Movie? movie;
  const AddEditMoviePage({
    super.key,
    this.movie
  });

  @override
  State<AddEditMoviePage> createState() => _AddEditMoviePageState();
}

class _AddEditMoviePageState extends State<AddEditMoviePage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String posterUrl;
  late String director;
  late String description;
  late String releaseTime;
  late String endTime;

  @override
  void initState() {
    super.initState();

    title = widget.movie?.title ?? '';
    posterUrl = widget.movie?.posterUrl ?? '';
    director = widget.movie?.director ?? '';
    description = widget.movie?.description ?? '';
  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isFormValid ? null : Colors.grey.shade300,
        ),
        onPressed: addOrUpdateMovie,
        child: const Text(
          'Save',
          style: TextStyle(
              color: Colors.black54
          ),
        ),
      ),
    );
  }

  void addOrUpdateMovie() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.movie != null;

      if (isUpdating) {
        await updateMovie();
      } else {
        await addMovie();
      }

      if(mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  Future updateMovie() async {
    final note = widget.movie!.copy(
      title: title,
      posterUrl: posterUrl,
      director: director,
      description: description,
    );

    await MoviesDatabase.instance.update(note);
  }

  Future addMovie() async {
    final movie = Movie(
      title: title,
      posterUrl: posterUrl,
      director: director,
      description: description,
      releaseTime: DateTime.now(),
      endTime: DateTime.now(),
    );

    await MoviesDatabase.instance.create(movie);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      actions: [buildButton()],
    ),
    body:
    Container(
      color: Colors.blueAccent,
      child: Form(
        key: _formKey,
        child: MovieFormWidget(
          title: title,
          posterUrl: posterUrl,
          director: director,
          description: description,
          releaseTime: "",
          endTime: "",
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedPoster: (posterUrl) => setState(() => this.posterUrl = posterUrl),
          onChangedDirector: (director) => setState(() => this.director = director),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
          onChangedRelease: (release) {},
          onChangedEnd: (end) {},
        ),
      ),
    ),
  );
}
