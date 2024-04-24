import 'package:flutter/material.dart';

class MovieFormWidget extends StatelessWidget {
  final String? title;
  final String? posterUrl;
  final String? director;
  final String? description;
  final String? releaseTime;
  final String? endTime;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedPoster;
  final ValueChanged<String> onChangedDirector;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedRelease;
  final ValueChanged<String> onChangedEnd;

  const MovieFormWidget({
    Key? key,
    this.title = '',
    this.posterUrl = '',
    this.director = '',
    this.description = '',
    this.releaseTime = '',
    this.endTime = '',
    required this.onChangedTitle,
    required this.onChangedPoster,
    required this.onChangedDirector,
    required this.onChangedDescription,
    required this.onChangedRelease,
    required this.onChangedEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          const SizedBox(height: 8),
          buildPoster(),
          const SizedBox(height: 8),
          buildDirector(),
          const SizedBox(height: 8),
          buildRelease(),
          const SizedBox(height: 8),
          buildEnd(),
          const SizedBox(height: 8),
          buildDescription(),
          const SizedBox(height: 500),
        ],
      ),
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    style: const TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Title',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedTitle,
  );

  Widget buildPoster() => TextFormField(
    maxLines: 1,
    initialValue: posterUrl,
    style: const TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Poster Url',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (posterUrl) =>
    posterUrl != null && posterUrl.isEmpty ? 'The poster url cannot be empty' : null,
    onChanged: onChangedPoster,
  );

  Widget buildDirector() => TextFormField(
    maxLines: 1,
    initialValue: director,
    style: const TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Director',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (director) =>
    director != null && director.isEmpty ? 'The director cannot be empty' : null,
    onChanged: onChangedDirector,
  );

  Widget buildRelease() => TextFormField(
    maxLines: 1,
    initialValue: releaseTime,
    style: const TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Release Date',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (releaseTime) =>
    releaseTime != null && releaseTime.isEmpty ? 'invalid' : null,
    onChanged: onChangedRelease,
  );

  Widget buildEnd() => TextFormField(
    maxLines: 1,
    initialValue: endTime,
    style: const TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Release Date',
      hintStyle: TextStyle(color: Colors.white70),
    ),
    validator: (endTime) =>
    endTime != null && endTime.isEmpty ? 'invalid' : null,
    onChanged: onChangedEnd,
  );

  Widget buildDescription() => TextFormField(
    maxLines: 5,
    initialValue: description,
    style: const TextStyle(color: Colors.white60, fontSize: 18),
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Movie description...',
      hintStyle: TextStyle(color: Colors.white60),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedDescription,
  );
}
